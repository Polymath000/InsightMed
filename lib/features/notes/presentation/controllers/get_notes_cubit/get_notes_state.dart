part of 'get_notes_cubit.dart';

@immutable
sealed class GetNotesState {
  const GetNotesState();
}

final class GetNotesInitial extends GetNotesState {
  const GetNotesInitial();
}

final class GetNotesLoading extends GetNotesState {
  const GetNotesLoading();
}

final class GetNotesSuccess extends GetNotesState {
  const GetNotesSuccess({required this.notes});
  final List<NoteEntity> notes;
}

final class GetNotesFailure extends GetNotesState {
  const GetNotesFailure(this.message);
  final String message;
}
