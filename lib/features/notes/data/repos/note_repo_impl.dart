import '../../../../core/constants/end_ponits.dart';
import '../../../../core/helpers/list_handler.dart';
import '../../../../core/services/database_service.dart';
import '../../domain/entities/note_entity.dart';
import '../../domain/repos/note_repo.dart' show NoteRepo;
import '../models/note_model.dart';

final class NoteRepoImpl implements NoteRepo {
  const NoteRepoImpl(this._database);
  final DatabaseService _database;

  @override
  Future<void> add(final NoteEntity note) => _database.addDocument(
    path: EndPoint.addNotes,
    data: NoteModel.fromEntity(note).toJson(),
  );

  @override
  Future<void> update(final NoteEntity note) => _database.addDocument(
    path: EndPoint.updateNotes(note.id!),
    data: NoteModel.fromEntity(note).toJson(),
    documentId: '',
  );

  @override
  Future<void> delete(final NoteEntity note) => _database.addDocument(
    path: EndPoint.deleteNotes(note.id!),
    data: NoteModel.fromEntity(note).toJson(),
    documentId: '',
  );

  @override
  Future<List<NoteEntity>> get(final int id) => _database
      .getDocument(path: EndPoint.getNotes(id), documentId: '')
      .then(
        (final json) => ListHandler.parseComplex<NoteEntity>(
          json['data'],
          NoteModel.fromJson,
        )!,
      );
}
