part of 'set_note_cubit.dart';

@immutable
sealed class SetNoteState {
  const SetNoteState();
}

final class SetNoteInitial extends SetNoteState {
  const SetNoteInitial();
}

final class SetNoteLoading extends SetNoteState {
  const SetNoteLoading();
}

final class SetNoteSuccess extends SetNoteState {
  const SetNoteSuccess();
}

final class SetNoteFailure extends SetNoteState {
  const SetNoteFailure(this.message);
  final String message;
}
