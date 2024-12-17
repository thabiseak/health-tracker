import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../core/app_export.dart';
import '../theme/custom_button_style.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_radio_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'bloc/about_bloc.dart';
import 'models/about_model.dart';
import 'models/agecategories_item_model.dart';
import 'widgets/agecategories_item_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AboutBloc>(
      create: (context) => AboutBloc(
        AboutState(
          aboutModelObj: AboutModel(),
        ),
      )..add(AboutInitialEvent()),
      child: AboutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              height: SizeUtils.height,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildNavigationArrows(context),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                      left: 28.h,
                      top: 38.h,
                      right: 28.h,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          ImageConstant.imgGroup166,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 78.h),
                        Text(
                          "msg_tell_us_about_you".tr,
                          style: theme.textTheme.headlineMedium,
                        ),
                        SizedBox(height: 52.h),
                        Text(
                          "msg_we_will_create_your".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                        SizedBox(height: 20.h),
                        _buildFitnessGoals(context),
                        SizedBox(height: 4.h),
                        _buildGenderInput(context),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: 62.h,
                      right: 54.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildMaleOption(context),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 20.h,
                                  width: 20.h,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgEllipse2,
                                        height: 20.h,
                                        width: double.maxFinite,
                                        radius: BorderRadius.circular(10.0.h),
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant.imgEllipse2,
                                        height: 20.h,
                                        width: double.maxFinite,
                                        radius: BorderRadius.circular(10.0.h),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}