import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/get_it_service.dart';
import '../../../domain/entities/note_entity.dart' show NoteEntity;
import '../../../domain/repos/note_repo.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit(this.patientId) : super(const GetNotesInitial()) {
    unawaited(getNotes());
  }
  final int patientId;

  Future<void> getNotes() async {
    try {
      
    } catch (e) {
      
    }
    emit(const GetNotesLoading());
    final notes = await getIt<NoteRepo>().get(patientId);
    emit(GetNotesSuccess(notes: notes));
  }
}
