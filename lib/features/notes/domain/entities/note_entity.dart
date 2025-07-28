class NoteEntity {
  const NoteEntity({
    this.id,
    this.title,
    this.note,
    this.patientId,
    this.rayId,
    this.createdAt,
  });
  final int? id;
  final String? title;
  final String? note;
  final int? patientId;
  final String? rayId;
  final DateTime? createdAt;

  NoteEntity copyWith({
    final int? id,
    final String? title,
    final String? description,
    final int? patientId,
    final String? rayId,
    final DateTime? createdAt,
  }) => NoteEntity(
    id: id ?? this.id,
    title: title ?? this.title,
    note: description ?? this.note,
    patientId: patientId ?? this.patientId,
    rayId: rayId ?? this.rayId,
    createdAt: createdAt ?? this.createdAt,
  );
}
