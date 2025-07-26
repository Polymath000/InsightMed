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

  Future<UserEntity> getUserFromApi();

  UserEntity? getUserFromLocal();

  Future<List<UserEntity>> getPatientsFromApi();

  Future<List<UserEntity>> getDoctors();

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
  Future<UserEntity> getUserFromApi() => _database
      .getDocument(path: EndPoint.getUser, documentId: '')
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
  Future<List<UserEntity>> getPatientsFromApi() => _database
      .getDocument(path: EndPoint.getPatients, documentId: '')
      .then(
        (final json) => (json['data'] as List<dynamic>)
            .map((final e) => UserModel.fromJson(e).toEntity())
            .toList(),
      );

  @override
  Future<List<UserEntity>> getDoctors() => _database
      .getDocument(path: EndPoint.getDoctors, documentId: '')
      .then(
        (final json) => (json['data'] as List<dynamic>)
            .map((final e) => UserModel.fromJson(e).toEntity())
            .toList(),
      );

  @override
  Future<void> deleteFromLocal() =>
      SharedPreferencesSingleton.remove(LocalKeys.user);
}
