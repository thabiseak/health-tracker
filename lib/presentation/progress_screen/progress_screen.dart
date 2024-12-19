import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/progress_bloc.dart';
import 'models/progress_model.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProgressBloc>(
      create: (context) => ProgressBloc(ProgressState(progressModelObj: ProgressModel()))
        ..add(ProgressInitialEvent()),
      child: ProgressScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBloc, ProgressState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: _buildAppBar(context),
            body: Container(
              width: double.maxFinite,
              height: SizeUtils.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.5, 0),
                  end: Alignment(0.5, 1),
                  colors: [
                    appTheme.black900,
                    theme.colorScheme.primary,
                    appTheme.black900,
                  ],
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 56.h),
                child: SingleChildScrollView(
                  child: Container(
                    height: 876.h,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 800.h,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.img71,
                                height: 800.h,
                                width: double.maxFinite,
                              ),
                              _buildSuccessMessageSection(context),
                              _buildSuccessCriteriaAnalysis(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 56.h,
      leadingWidth: 30.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray50,
        margin: EdgeInsets.only(left: 11.h),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
    );
  }

  Widget _buildSuccessMessageSection(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 128.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.img5RemovebgPreview,
              height: 312.h,
              width: 304.h,
            ),
            Text(
              "msg_you_have_done_well".tr,
              style: theme.textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessCriteriaAnalysis(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 58.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "msg_analysis_your_success".tr,
              style: theme.textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
