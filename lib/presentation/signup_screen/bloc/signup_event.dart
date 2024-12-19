part of 'signup_bloc.dart';

/// Abstract class for all events that can be dispatched from the Signup widget.
/// Events must be immutable and implement the [Equatable] interface.
abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Signup widget is first created.
class SignupInitialEvent extends SignupEvent {
  @override
  List<Object?> get props => [];
}

/// Event for changing password visibility.
// ignore_for_file: must_be_immutable
class ChangePasswordVisibilityEvent extends SignupEvent {
  ChangePasswordVisibilityEvent({required this.value});
  final bool value;

  @override
  List<Object?> get props => [value];
}

/// Event for changing password visibility (alternative version).
// ignore_for_file: must_be_immutable
class ChangePasswordVisibilityEvent1 extends SignupEvent {
  ChangePasswordVisibilityEvent1({required this.value});
  final bool value;

  @override
  List<Object?> get props => [value];
}

/// Event for changing checkbox.
// ignore_for_file: must_be_immutable
class ChangeCheckBoxEvent extends SignupEvent {
  ChangeCheckBoxEvent({required this.value});
  final bool value;

  @override
  List<Object?> get props => [value];
}
