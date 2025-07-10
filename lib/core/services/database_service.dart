import 'package:flutter/foundation.dart' show immutable;

import '../entities/query_entity.dart' show QueryEntity;

@immutable
abstract interface class DatabaseService {
  const DatabaseService();

  /// Adders
  Future<void> addDocument({
    required final String path,
    required final Map<String, dynamic> data,
    final String? documentId,
  });
  Future<void> addSubDocument({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
    required final String subDocumentId,
    required final Map<String, dynamic> data,
  });
  Future<void> addValue({
    required final String path,
    required final String documentId,
    required final String key,
    required final List<Object?> data,
  });
  Future<void> addSubValue({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
    required final String subDocumentId,
    required final String key,
    required final List<Object?> data,
  });

  /// Updaters
  Future<void> updateCollection({
    required final String path,
    required final Map<String, dynamic> data,
  });
  Future<void> updateDocument({
    required final String path,
    required final Map<String, dynamic> data,
    required final String documentId,
  });
  Future<void> updateDocuments({
    required final String path,
    required final Map<String, dynamic> data,
    required final List<String> documentIds,
  });
  Future<void> updateSubDocument({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
    required final String subDocumentId,
    required final Map<String, dynamic> data,
  });
  Future<void> updateKey({
    required final String path,
    required final String oldKey,
    required final String newKey,
  });

  Future<bool> isDocumentExists({
    required final String path,
    required final String documentId,
  });

  /// Normal getters
  Future<List<Map<String, dynamic>>> getCollection({
    required final String path,
  });
  Future<Map<String, dynamic>> getDocument({
    required final String path,
    required final String documentId,
  });
  Future<List<Map<String, dynamic>>> getDocuments({
    required final String path,
    required final List<String> documentIds,
  });
  Future<List<Map<String, dynamic>>> getSubCollection({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
  });

  /// Getters with query
  Future<List<Map<String, dynamic>>> getCollectionWithQuery({
    required final String path,
    required final QueryEntity query,
  });
  Future<List<Map<String, dynamic>>> getDocumentsWithQuery({
    required final String path,
    required final List<String> documentIds,
    required final QueryEntity query,
  });
  Future<List<Map<String, dynamic>>> getSubCollectionWithQuery({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
    required final QueryEntity query,
  });

  /// Stream getters
  Stream<List<Map<String, dynamic>>> streamCollection({
    required final String path,
  });
  Stream<Map<String, dynamic>> streamDocument({
    required final String path,
    required final String documentId,
  });
  Stream<List<Map<String, dynamic>>> streamDocuments({
    required final String path,
    required final List<String> documentIds,
  });
  Stream<List<Map<String, dynamic>>> streamSubCollection({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
  });

  /// Stream getters with query
  Stream<List<Map<String, dynamic>>> streamCollectionWithQuery({
    required final String path,
    required final QueryEntity query,
  });
  Stream<List<Map<String, dynamic>>> streamDocumentsWithQuery({
    required final String path,
    required final List<String> documentIds,
    required final QueryEntity query,
  });
  Stream<List<Map<String, dynamic>>> streamSupCollectionWithQuery({
    required final String collectionPath,
    required final String documentId,
    required final String subCollectionPath,
    required final QueryEntity query,
  });

  /// Deleters
  Future<void> deleteCollection({required final String path});
  Future<void> deleteDocument({
    required final String path,
    required final String documentId,
  });
  Future<void> deleteDocuments({
    required final String path,
    required final List<String> documentIds,
  });
}
