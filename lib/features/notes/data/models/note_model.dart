import '../../../../core/extensions/string_extension.dart';
import '../../domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  const NoteModel({
    super.id,
    super.title,
    super.note,
    super.patientId,
    super.rayId,
    super.createdAt,
  });

  factory NoteModel.fromEntity(final NoteEntity entity) => NoteModel(
    id: entity.id,
    title: entity.title,
    note: entity.note,
    patientId: entity.patientId,
    rayId: entity.rayId,
    createdAt: entity.createdAt,
  );

  factory NoteModel.fromJson(final Map<String, dynamic> json) => NoteModel(
    id: json['id'],
    title: json['title'],
    note: json['note'],
    patientId: json['patient_id'],
    rayId: json['ray_id'],
    createdAt: (json['created_at'] as String?)?.toDateTime(),
  );

  NoteEntity toEntity() => NoteEntity(
    id: id,
    title: title,
    note: note,
    patientId: patientId,
    rayId: rayId,
    createdAt: createdAt,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'note': note,
    'patient_id': patientId,
    'ray_id': rayId,
    'created_at': createdAt?.toIso8601String(),
    'doctor_id': 5,
  };
}
