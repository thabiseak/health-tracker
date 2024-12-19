part of 'signup_bloc.dart';

/// Represents the state of Signup in the application.
// ignore_for_file: must_be_immutable
class SignupState extends Equatable {
  SignupState({
    this.fullNameInputController,
    this.emailInputController,
    this.passwordInputController,
    this.confirmPasswordInputController,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.bysigningupyoua = false,
    this.signupModelObj,
  });

  TextEditingController? fullNameInputController;
  TextEditingController? emailInputController;
  TextEditingController? passwordInputController;
  TextEditingController? confirmPasswordInputController;
  SignupModel? signupModelObj;
  bool isShowPassword;
  bool isShowPassword1;
  bool bysigningupyoua;

  @override
  List<Object?> get props => [
        fullNameInputController,
        emailInputController,
        passwordInputController,
        confirmPasswordInputController,
        isShowPassword,
        isShowPassword1,
        bysigningupyoua,
        signupModelObj,
      ];

  SignupState copyWith({
    TextEditingController? fullNameInputController,
    TextEditingController? emailInputController,
    TextEditingController? passwordInputController,
    TextEditingController? confirmPasswordInputController,
    bool? isShowPassword,
    bool? isShowPassword1,
    bool? bysigningupyoua,
    SignupModel? signupModelObj,
  }) {
    return SignupState(
      fullNameInputController:
          fullNameInputController ?? this.fullNameInputController,
      emailInputController: emailInputController ?? this.emailInputController,
      passwordInputController:
          passwordInputController ?? this.passwordInputController,
      confirmPasswordInputController:
          confirmPasswordInputController ?? this.confirmPasswordInputController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      bysigningupyoua: bysigningupyoua ?? this.bysigningupyoua,
      signupModelObj: signupModelObj ?? this.signupModelObj,
    );
  }
}
