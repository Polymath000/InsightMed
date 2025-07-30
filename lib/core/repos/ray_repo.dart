import '../constants/end_ponits.dart';
import '../entities/ray_entity.dart';
import '../helpers/list_handler.dart';
import '../models/ray_model.dart';
import '../services/database_service.dart';

sealed class RayRepo {
  const RayRepo();
  Future<List<RayEntity>> getAIRays(final String patientId);
  Future<List<RayEntity>> getRays();
  Future<void> add(final RayEntity ray);
  Future<void> update(final RayEntity ray);
  Future<void> delete(final RayEntity ray);
}

final class RayRepoImpl implements RayRepo {
  const RayRepoImpl(this._database);
  final DatabaseService _database;

  @override
  Future<List<RayEntity>> getAIRays(final String patientId) => _database
      .getDocument(path: EndPoint.getAIRays(patientId), documentId: '')
      .then(
        (final json) => ListHandler.parseComplex<RayEntity>(
          json['data'],
          (final e) => RayModel.fromJson(e).toEntity(),
        )!,
      );

  @override
  Future<List<RayEntity>> getRays() => _database
      .getDocument(path: EndPoint.getRays, documentId: '')
      .then(
        (final json) => ListHandler.parseComplex<RayEntity>(
          json['data'],
          (final e) => RayModel.fromJson(e).toEntity(),
        )!,
      );

  @override
  Future<void> add(final RayEntity ray) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(final RayEntity ray) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(final RayEntity ray) {
    throw UnimplementedError();
  }
}
