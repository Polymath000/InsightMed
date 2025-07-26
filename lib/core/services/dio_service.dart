import '../entities/query_entity.dart';
import '../models/user_model.dart';
import 'api_client.dart';
import 'database_service.dart';
import 'dio/auth_dio.dart';

class DatabaseServiceImpl implements DatabaseService {
  const DatabaseServiceImpl(this._client);
  final ApiClient _client;

  @override
  Future<void> addDocument({
    required final String path,
    required final Map<String, dynamic> data,
    final String? documentId,
  }) => _client.post(path: '$path/$documentId', data: data);

  @override
  Future<void> addSubDocument({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
    required final String subDocumentId,
    required final Map<String, dynamic> data,
  }) => _client.post(
    path: '$collectionPath/$documentId/$subCollectionPath/$subDocumentId',
    data: data,
  );

  @override
  Future<void> addSubValue({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
    required final String subDocumentId,
    required final String key,
    required final List<Object?> data,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> addValue({
    required final String path,
    required final String documentId,
    required final String key,
    required final List<Object?> data,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCollection({required final String path}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDocument({
    required final String path,
    required final String documentId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDocuments({
    required final String path,
    required final List<String> documentIds,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getCollection({
    required final String path,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getCollectionWithQuery({
    required final String path,
    required final QueryEntity query,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getDocument({
    required final String path,
    required final String documentId,
  }) => _client.get(path);

  @override
  Future<List<Map<String, dynamic>>> getDocuments({
    required final String path,
    required final List<String> documentIds,
  }) {
    final futures = documentIds.map(
      (final id) => getDocument(path: path, documentId: id),
    );
    return Future.wait(futures);
  }

  @override
  Future<List<Map<String, dynamic>>> getDocumentsWithQuery({
    required final String path,
    required final List<String> documentIds,
    required final QueryEntity query,
  }) {
    final futures = documentIds.map(
      (final id) => getDocument(path: path, documentId: id),
    );
    return Future.wait(futures);
  }

  @override
  Future<List<Map<String, dynamic>>> getSubCollection({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getSubCollectionWithQuery({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
    required final QueryEntity query,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<bool> isDocumentExists({
    required final String path,
    required final String documentId,
  }) => _client.get(path).then((final data) => data.isNotEmpty);

  @override
  Stream<List<Map<String, dynamic>>> streamCollection({
    required final String path,
  }) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Map<String, dynamic>>> streamCollectionWithQuery({
    required final String path,
    required final QueryEntity query,
  }) {
    throw UnimplementedError();
  }

  @override
  Stream<Map<String, dynamic>> streamDocument({
    required final String path,
    required final String documentId,
  }) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Map<String, dynamic>>> streamDocuments({
    required final String path,
    required final List<String> documentIds,
  }) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Map<String, dynamic>>> streamDocumentsWithQuery({
    required final String path,
    required final List<String> documentIds,
    required final QueryEntity query,
  }) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Map<String, dynamic>>> streamSubCollection({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
  }) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Map<String, dynamic>>> streamSupCollectionWithQuery({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
    required final QueryEntity query,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateCollection({
    required final String path,
    required final Map<String, dynamic> data,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateDocument({
    required final String path,
    required final Map<String, dynamic> data,
    required final String documentId,
  }) async {
    final dioInstance = dio();
    final response = await dioInstance.put(path, data: data, );
  }

  @override
  Future<void> updateDocuments({
    required final String path,
    required final Map<String, dynamic> data,
    required final List<String> documentIds,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateKey({
    required final String path,
    required final String oldKey,
    required final String newKey,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateSubDocument({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
    required final String subDocumentId,
    required final Map<String, dynamic> data,
  }) {
    throw UnimplementedError();
  }
}
