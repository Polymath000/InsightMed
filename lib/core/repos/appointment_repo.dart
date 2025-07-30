import 'package:dio/dio.dart';

import '../constants/end_ponits.dart';
import '../entities/appointment_entity.dart';
import '../helpers/list_handler.dart';
import '../models/appointment_model.dart';
import '../services/database_service.dart';

sealed class AppointmentRepo {
  const AppointmentRepo();
  Future<void> add(final AppointmentEntity appointment);
  Future<void> update(final AppointmentEntity appointment);
  Future<void> delete(final AppointmentEntity appointment);
  Future<AppointmentEntity> get();
  Future<List<AppointmentEntity>> getAvailableAppointments();
  Future<List<AppointmentEntity>> getPatientAppiontment(final String email);
}

class AppointmentRepoImpl implements AppointmentRepo {
  const AppointmentRepoImpl(this._database);
  final DatabaseService _database;
  @override
  Future<void> add(final AppointmentEntity appointment) => _database
      .addDocument(path: EndPoint.addAppointments, data: {}, documentId: '');

  @override
  Future<void> delete(final AppointmentEntity appointment) {
    throw UnimplementedError();
  }

  @override
  Future<AppointmentEntity> get() => _database
      .getDocument(path: EndPoint.getUserAppointments, documentId: '')
      .then((final json) => AppointmentModel.fromJson(json['data']).toEntity())
      .onError<DioException>((final error, _) {
        if (error.message?.contains('404') ?? false) {
          return const AppointmentEntity();
        }
        throw error;
      });

  @override
  Future<List<AppointmentEntity>> getAvailableAppointments() => _database
      .getDocument(path: EndPoint.getAvailableAppointments, documentId: '')
      .then(
        (final json) => ListHandler.parseComplex<AppointmentEntity>(
          json['data'],
          (final e) => AppointmentModel.fromJson(e).toEntity(),
        )!,
      );

  @override
  Future<List<AppointmentEntity>> getPatientAppiontment(final String email) =>
      _database
          .getDocument(
            path: EndPoint.getPatientAppiontment(email),
            documentId: '',
          )
          .then(
            (final json) => ListHandler.parseComplex<AppointmentEntity>(
              json['appointments'],
              (final e) => AppointmentModel.fromJson(e).toEntity(),
            )!,
          );

  @override
  Future<void> update(final AppointmentEntity appointment) {
    throw UnimplementedError();
  }
}
