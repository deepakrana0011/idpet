import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/constants/decoration.dart';
import 'package:dog_app/constants/dimension_constants.dart';
import 'package:dog_app/constants/image_constants.dart';
import 'package:dog_app/constants/string_Constants.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/widgets/custom_shape.dart';
import 'package:dog_app/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

import '../../constants/route_constants.dart';
import '../../constants/validations.dart';
import '../../helper/keyboard_helper.dart';
import '../../provider/login_provider.dart';
import '../base_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        body: BaseView<LoginProvider>(
            onModelReady: (provider) {},
            builder: (context, provider, _) {
              return SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Form(
                      key: provider.formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: DimensionConstants.d20.w),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: DimensionConstants.d76.h,
                              ),
                              child: SizedBox(
                                height: DimensionConstants.d66.h,
                                width: DimensionConstants.d162.w,
                                child: const ImageView(
                                  path: ImagesConstants.primaryImage,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: DimensionConstants.d51.h,
                                  right: DimensionConstants.d20.w),
                              child: SizedBox(
                                height: DimensionConstants.d60.h,
                                width: DimensionConstants.d334.w,
                                child: Text("logIn".tr()).boldText(
                                    ColorConstants.blackColor,
                                    DimensionConstants.d30.sp,
                                    TextAlign.center),
                              ),
                            ),
                            SizedBox(
                              height: DimensionConstants.d60.h,
                              child: TextFormField(
                                controller: provider.emailController,
                                decoration:
                                    ViewDecoration.inputDecorationWithCurve(
                                        "email".tr(), Colors.transparent,
                                        radius: DimensionConstants.d15),
                              ),
                            ),
                            SizedBox(
                              height: DimensionConstants.d19.h,
                            ),
                            SizedBox(
                              height: DimensionConstants.d60.h,
                              child: TextFormField(
                                obscureText: provider.isPasswordVisible,
                                controller: provider.passwordController,
                                decoration: ViewDecoration
                                    .inputDecorationWithCurvePassword(
                                        "password".tr(), Colors.transparent,
                                        suffixIcon: IconButton(
                                            splashRadius:
                                                DimensionConstants.d1.r,
                                            onPressed: () {
                                              provider.visiblePassword();
                                            },
                                            icon: Icon(
                                              provider.isPasswordVisible
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: ColorConstants.blackColor,
                                            )),
                                        radius: DimensionConstants.d15),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: DimensionConstants.d10.h,
                                    left: DimensionConstants.d216.w),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        RoutesConstants.forgotPassword);
                                  },
                                  child: Text("forgotPassword?".tr()).boldText(
                                      ColorConstants.blackColor,
                                      DimensionConstants.d16.sp,
                                      TextAlign.end),
                                )),
                            provider.state == ViewState.Busy
                                ? Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: DimensionConstants.d20.h),
                                      child: const CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  ColorConstants.primaryColor)),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      movetoNext(context, provider);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: DimensionConstants.d20.h),
                                      child: CustomShape(
                                          bgColor: ColorConstants.blackColor,
                                          radius: const BorderRadius.all(
                                              Radius.circular(
                                                  DimensionConstants.d10)),
                                          height: DimensionConstants.d54.h,
                                          width: DimensionConstants.d374.w,
                                          child: Center(
                                            child: Text("logIn".tr()).boldText(
                                                ColorConstants.whiteColor,
                                                DimensionConstants.d20.sp,
                                                TextAlign.center),
                                          )),
                                    ),
                                  ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: DimensionConstants.d20.h,
                                  left: DimensionConstants.d49.w,
                                  right: DimensionConstants.d49.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("don'tHaveAccount".tr()).regularText(
                                      ColorConstants.blackColor,
                                      DimensionConstants.d18.sp,
                                      TextAlign.center),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(RoutesConstants.signUp);
                                    },
                                    child: Text("signUp".tr()).boldText(
                                        ColorConstants.primaryColor,
                                        DimensionConstants.d18.sp,
                                        TextAlign.center),
                                  )
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
            }));
  }
}

movetoNext(BuildContext context, LoginProvider provider) async {
  if (provider.emailController.text.trim().isEmpty) {
    DialogHelper.showMessage(context, 'empty_email'.tr());
  } else if (!Validations.emailValidation(
      provider.emailController.text.trim())) {
    DialogHelper.showMessage(context, 'invalid_email'.tr());
  } else if (provider.passwordController.text.trim().isEmpty) {
    DialogHelper.showMessage(context, "empty_password".tr());
  } else if (provider.passwordController.text.length < 6) {
    DialogHelper.showMessage(context, 'password_length_error'.tr());
  } else { KeyboardHelper.hideKeyboard(context);
    provider.login(context, provider.emailController.text,
        provider.passwordController.text);
  }
}
