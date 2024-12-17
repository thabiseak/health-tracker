import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/welcome_bloc.dart';
import 'models/welcome_model.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<WelcomeBloc>(
      create: (context) => WelcomeBloc(WelcomeState(
        welcomeModelObj: WelcomeModel(),
      ))
        ..add(WelcomeInitialEvent()),
      child: WelcomeScreen(),
    );
  }

  @override
Widget build(BuildContext context) {
  return BlocBuilder<WelcomeBloc, WelcomeState>(
    builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Container(
                height: SizeUtils.height,
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.img8bbe484b1091ae9,
                      height: 610.h,
                      width: double.maxFinite,
                    ),
                    SizedBox(height: 34.h),
                    _buildIntroSection(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

