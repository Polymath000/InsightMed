import 'dart:developer' show log;
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart'
    show Bloc, BlocBase, BlocObserver, Change, Transition;

@immutable
final class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  AppBlocObserver init() => Bloc.observer = this;

  @override
  void onCreate(final BlocBase<dynamic> bloc) {
    log('${bloc.runtimeType} created');
    super.onCreate(bloc);
  }

  @override
  void onChange(final BlocBase<dynamic> bloc, final Change<dynamic> change) {
    log('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }

  @override
  void onClose(final BlocBase<dynamic> bloc) {
    log('${bloc.runtimeType} closed');
    super.onClose(bloc);
  }

  @override
  void onTransition(
    final Bloc<dynamic, dynamic> bloc,
    final Transition<dynamic, dynamic> transition,
  ) {
    log('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(final Bloc<dynamic, dynamic> bloc, final Object? event) {
    log('${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(
    final BlocBase<dynamic> bloc,
    final Object error,
    final StackTrace stackTrace,
  ) {
    log('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }
}
