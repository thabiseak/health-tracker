import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/signup_bloc.dart';
import 'models/signup_model.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (context) => SignupBloc(SignupState(signupModelObj: SignupModel()))
        ..add(SignupInitialEvent()),
      child: SignupScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.black900,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                      imagePath: ImageConstants.imgEllipse4118x430,
                    _buildJoinUsSection(context),
                    SizedBox(height: 34.h),
                    _buildFormSection(context),
                    SizedBox(height: 6.h),
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse4118x430,
                      height: 118.h,
                      width: double.maxFinite,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildJoinUsSection(BuildContext context) {
    return SizedBox(
      height: 318.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 42.h),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.imgGroup53),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 2.h),
                  Text(
                    "msg_join_us_and_start".tr,
                    style: theme.textTheme.headlineMedium,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "msg_create_an_account".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 6.h),
                  CustomImageView(
                    imagePath: ImageConstant.imgImage,
                    height: 112.h,
                    width: 116.h,
                  ),
                  Text(
                    "msg_create_your_account".tr,
                    style: theme.textTheme.headlineLarge,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse5,
                    height: 300.h,
                    width: 380.h,
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      selector: (state) => state?.fullNameInputController,
  }

  /// Section Widget
  Widget _buildFullNameInput(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
      selector: (state) => state.fullNameInputController,
      builder: (context, fullNameInputController) {
        return CustomTextFormField(
          controller: fullNameInputController,
          hintText: "msg_enter_your_full".tr,
          hintStyle: CustomTextStyles.bodySmallInter,
          contentPadding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 8.h),
          validator: (value) {
            if (isText(value)) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
        );
      },
      selector: (state) => state?.emailInputController,
  }

  /// Section Widget
  Widget _buildEmailInput(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
      selector: (state) => state.emailInputController,
      builder: (context, emailInputController) {
        return CustomTextFormField(
              imagePath: ImageConstants.imgEyeOffOnerrorcontainer,
          hintText: "msg_enter_your_email".tr,
          textInputType: TextInputType.emailAddress,
          suffix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 8.h, 14.h, 8.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgEyeOffOnerrorcontainer,
              height: 20.h,
              width: 20.h,
              fit: BoxFit.contain,
            ),
          ),
          suffixConstraints: BoxConstraints(maxHeight: 36.h),
          contentPadding: EdgeInsets.fromLTRB(24.h, 8.h, 14.h, 8.h),
          validator: (value) {
            if (value == null || !isValidEmail(value, isRequired: true)) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          },
        );
      },
    );
  }
          controller: state?.passwordInputController,
  /// Section Widget
  Widget _buildPasswordInput(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return CustomTextFormField(
          controller: state.passwordInputController,
          hintText: "msg_create_a_password".tr,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
            onTap: () {
              context.read<SignupBloc>().add(
                    ChangePasswordVisibilityEvent(value: !state.isShowPassword),
                  );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(16.h, 8.h, 14.h, 8.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgEyeOff,
                height: 20.h,
          obscureText: state?.isShowPassword ?? true,
                fit: BoxFit.contain,
              ),
            ),
          ),
          suffixConstraints: BoxConstraints(maxHeight: 36.h),
          obscureText: state.isShowPassword,
          contentPadding: EdgeInsets.fromLTRB(24.h, 8.h, 14.h, 8.h),
          validator: (value) {
            if (value == null || !isValidPassword(value, isRequired: true)) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
        );
      },
    );
  }
          controller: state?.confirmPasswordInputController,
  /// Section Widget
  Widget _buildConfirmPasswordInput(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return CustomTextFormField(
          controller: state.confirmPasswordInputController,
          hintText: "msg_confirm_your_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
            onTap: () {
              context.read<SignupBloc>().add(
                    ChangePasswordVisibilityEvent(value: !state.isShowPassword),
                  );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(16.h, 8.h, 14.h, 8.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgEyeOff,
                height: 20.h,
                width: 20.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          suffixConstraints: BoxConstraints(maxHeight: 40.h),
          obscureText: state.isShowPassword,
          contentPadding: EdgeInsets.fromLTRB(24.h, 8.h, 14.h, 8.h),
          validator: (value) {
            if (value == null || !isValidPassword(value, isRequired: true)) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
      width: 244.h,
      text: "Ibl_sign_up".tr,
      onPressed: () {
        // Implement your sign-up logic here
      },
    );
  }

  /// Section Widget
  Widget _buildFormSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          SizedBox(
            height: 454.h,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ibl_full_name".tr,
                          style: theme.textTheme.bodyMedium,
                        ),
                        SizedBox(height: 14.h),
                        _buildFullNameInput(context),
                        SizedBox(height: 14.h),
                        Text(
                          "Ibl_email".tr,
                          style: theme.textTheme.bodyMedium,
                        ),
                        SizedBox(height: 14.h),
                        _buildEmailInput(context),
                        SizedBox(height: 14.h),
                        Text(
                          "Ibl_password".tr,
                          style: theme.textTheme.bodyMedium,
                        ),
                        SizedBox(height: 14.h),
                        _buildPasswordInput(context),
                        SizedBox(height: 14.h),
                        Text(
                          "msg_confirm_password".tr,
                          selector: (state) => state?.bysigningupyoua,
                        ),
                        SizedBox(height: 14.h),
                        _buildConfirmPasswordInput(context),
                        SizedBox(height: 14.h),
                        BlocSelector<SignupBloc, SignupState, bool?>(
                          selector: (state) => state.bysigningupyoua,
                          builder: (context, bysigningupyoua) {
                            return CustomCheckboxButton(
                              text: "msg_by_signing_up_you".tr,
                              isExpandedText: true,
                              value: bysigningupyoua,
                              onChange: (value) {
                                context.read<SignupBloc>().add(
                                      ChangeCheckBoxEvent(value: value),
                                    );
                              },
                            );
                          },
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          "lbl_full_name".tr,
                          style: theme.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onTapColumnSignup(context);
                  },
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildSignUpButton(context),
                        SizedBox(height: 10.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "msg_already_have_an_account".tr,
                                style: CustomTextStyles.bodySmallOnErrorContainer,
                              ),
                              TextSpan(
                                text: "Ibl_log_in_here".tr,
                                style: theme.textTheme.labelLarge,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTapColumnSignup(BuildContext context) {
    // Navigating to the profile screen when the text is tapped
    NavigatorService.pushNamed(AppRoutes.profileScreen);
  }
}


