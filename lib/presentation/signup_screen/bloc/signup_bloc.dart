import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/signup_model.dart';
part 'signup_event.dart';
part 'signup_state.dart';

/// A bloc that manages the state of a Signup according to the event that is dispatched to it
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(SignupState initialState) : super(initialState) {
    on<SignupInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
  }

  void _onInitialize(
    SignupInitialEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(
      state.copyWith(
        fullNameInputController: TextEditingController(),
        emailInputController: TextEditingController(),
        passwordInputController: TextEditingController(),
        confirmPasswordInputController: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true,
        bysigningupyoua: false,
      ),
    );
  }

  void _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(
        isShowPassword: event.value,
      ),
    );
  }

  void _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(
        isShowPassword1: event.value,
      ),
    );
  }

  void _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(
        bysigningupyoua: event.value,
      ),
    );
  }
}
