import '../entities/note_entity.dart' show NoteEntity;

abstract interface class NoteRepo {
  const NoteRepo();
  Future<void> add(final NoteEntity note);
  Future<void> update(final NoteEntity note);
  Future<void> delete(final NoteEntity note);
  Future<List<NoteEntity>> get(final int id);
}
