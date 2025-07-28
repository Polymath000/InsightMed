import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:meta/meta.dart';

import '../../../../../core/services/get_it_service.dart';
import '../../../domain/entities/note_entity.dart';
import '../../../domain/repos/note_repo.dart';

part 'set_note_state.dart';

class SetNoteCubit extends Cubit<SetNoteState> {
  SetNoteCubit() : super(const SetNoteInitial());

  Future<void> addNote(final NoteEntity note) async {
    emit(const SetNoteLoading());
    await getIt<NoteRepo>().add(note);
    emit(const SetNoteSuccess());
  }

  Future<void> updateNote(final NoteEntity note) async {
    emit(const SetNoteLoading());
    await getIt<NoteRepo>().update(note);
    emit(const SetNoteSuccess());
  }

  Future<void> deleteNote(final NoteEntity note) async {
    emit(const SetNoteLoading());
    await getIt<NoteRepo>().delete(note);
    emit(const SetNoteSuccess());
  }
}
