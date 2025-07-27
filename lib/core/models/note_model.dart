import '../entities/note_entity.dart';

class NoteModel extends NoteEntity {
  const NoteModel({super.note, super.patientId, super.rayId});

  factory NoteModel.fromEntity(final NoteEntity entity) => NoteModel(
    note: entity.note,
    patientId: entity.patientId,
    rayId: entity.rayId,
  );

  factory NoteModel.fromJson(final Map<String, dynamic> json) => NoteModel(
    note: json['note'],
    patientId: json['patient_id'],
    rayId: json['ray_id'],
  );

  NoteEntity toEntity() =>
      NoteEntity(note: note, patientId: patientId, rayId: rayId);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'note': note,
    'patient_id': patientId,
    'ray_id': rayId,
  };
}
