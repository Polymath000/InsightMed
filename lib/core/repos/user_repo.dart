import '../entities/user_entity.dart' show UserEntity;
import '../models/user_model.dart';
import '../services/database_service.dart';
import '../services/get_it_service.dart';

sealed class UserRepo {
  const UserRepo();

  Future<void> add(final UserEntity user);

  Future<void> update(final UserEntity user);

  Future<UserEntity> getUser(final String id);

  Future<List<UserEntity>> getUsers(final List<String> ids);

  Future<void> delete(final String id);
}

final class UserRepoImpl implements UserRepo {
  const UserRepoImpl();
  static final DatabaseService _database = getIt<DatabaseService>();
  static const String _path = 'users';

  @override
  Future<void> add(final UserEntity user) => _database.addDocument(
    path: _path,
    data: UserModel.fromEntity(user).toJson(),
    documentId: user.token,
  );

  @override
  Future<void> update(final UserEntity user) => _database.updateDocument(
    path: _path,
    data: UserModel.fromEntity(user).toJson(),
    documentId: user.token!,
  );

  @override
  Future<UserEntity> getUser(final String id) => _database
      .getDocument(path: _path, documentId: id)
      .then((final json) => UserModel.fromJson(json).toEntity());

  @override
  Future<List<UserEntity>> getUsers(final List<String> ids) => _database
      .getDocuments(path: _path, documentIds: ids)
      .then(
        (final jsons) => jsons
            .map((final json) => UserModel.fromJson(json).toEntity())
            .toList(),
      );

  @override
  Future<void> delete(final String id) =>
      _database.deleteDocument(path: _path, documentId: id);
}
