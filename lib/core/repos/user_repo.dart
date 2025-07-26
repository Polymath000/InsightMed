import 'dart:convert';

import '../constants/end_ponits.dart' show EndPoint;
import '../constants/local_keys.dart';
import '../entities/user_entity.dart' show UserEntity;
import '../models/user_model.dart';
import '../services/database_service.dart';
import '../services/shared_preferences_singleton.dart';

sealed class UserRepo {
  const UserRepo();

  Future<bool> addToLocal(final UserEntity user);

  Future<void> updateApi(final UserEntity user);

  Future<void> updateLocal(final UserEntity user);

  Future<void> update(final UserEntity user);

  Future<UserEntity> getUserFromApi(final String id);

  UserEntity? getUserFromLocal();

  Future<List<UserEntity>> getPatientsFromApi(final List<String> ids);

  Future<void> deleteFromLocal();
}

final class UserRepoImpl implements UserRepo {
  const UserRepoImpl(this._database);
  final DatabaseService _database;

  @override
  Future<bool> addToLocal(final UserEntity user) =>
      SharedPreferencesSingleton.setString(
        LocalKeys.user,
        jsonEncode(UserModel.fromEntity(user).toJson()),
      );

  @override
  Future<void> updateApi(final UserEntity user) => _database.updateDocument(
    path: EndPoint.updateUser,
    data: UserModel.fromEntity(user).toJson(),
    documentId: user.token!,
  );

  @override
  Future<void> updateLocal(final UserEntity user) =>
      SharedPreferencesSingleton.setString(
        LocalKeys.user,
        jsonEncode(UserModel.fromEntity(user).toJson()),
      );

  @override
  Future<void> update(final UserEntity user) =>
      updateApi(user).then((_) => updateLocal(user));

  @override
  Future<UserEntity> getUserFromApi(final String id) => _database
      .getDocument(path: EndPoint.getUser, documentId: id)
      .then((final json) => UserModel.fromJson(json['data']).toEntity());

  @override
  UserEntity? getUserFromLocal() {
    final encodedJson = SharedPreferencesSingleton.getString(LocalKeys.user);
    if (encodedJson?.isNotEmpty ?? false) {
      final json = jsonDecode(encodedJson!);
      return UserModel.fromJson(json).toEntity();
    } else {
      return null;
    }
  }

  @override
  Future<List<UserEntity>> getPatientsFromApi(final List<String> ids) =>
      _database
          .getDocuments(path: EndPoint.getPatients, documentIds: ids)
          .then(
            (final jsons) => jsons
                .map((final json) => UserModel.fromJson(json).toEntity())
                .toList(),
          );

  @override
  Future<void> deleteFromLocal() =>
      SharedPreferencesSingleton.remove(LocalKeys.user);
}
