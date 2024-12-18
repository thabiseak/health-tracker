part of 'app_navigation_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// AppNavigation widget.
///
/// Events must be immutable and implement the [Equatable] interface.
abstract class AppNavigationEvent extends Equatable {
  const AppNavigationEvent();

  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the AppNavigation widget is first created.
class AppNavigationInitialEvent extends AppNavigationEvent {
  const AppNavigationInitialEvent();

  @override
  List<Object?> get props => [];
}