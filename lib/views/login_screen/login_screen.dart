import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/constants/decoration.dart';
import 'package:dog_app/constants/dimension_constants.dart';
import 'package:dog_app/constants/image_constants.dart';
import 'package:dog_app/constants/string_Constants.dart';
import 'package:dog_app/extensions/allextensions.dart';
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
                          Padding(
                            padding:
                                EdgeInsets.only(left: DimensionConstants.d20.w),
                            child: Stack(
                              children: <Widget>[
                                CustomShape(
                                  bgColor: ColorConstants.lightGrayTextFiled,
                                  strokeColor: ColorConstants.whiteColor,
                                  radius: const BorderRadius.all(
                                      Radius.circular(DimensionConstants.d15)),
                                  height: DimensionConstants.d60.h,
                                  width: DimensionConstants.d374.w,
                                ),
                                TextFormField(
                                  controller: provider.emailController,
                                  decoration:
                                      ViewDecoration.inputDecorationWithCurve(
                                    "email".tr(),
                                    ColorConstants.lightGrayColor,
                                  ),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Empty email';
                                    } else if (!Validations.emailValidation(
                                        value)) {
                                      return 'Invalid email';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d19.h,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: DimensionConstants.d20.w),
                            child: Stack(
                              children: <Widget>[
                                CustomShape(
                                  bgColor: ColorConstants.lightGrayTextFiled,
                                  strokeColor: ColorConstants.whiteColor,
                                  radius: const BorderRadius.all(
                                      Radius.circular(DimensionConstants.d15)),
                                  height: DimensionConstants.d60.h,
                                  width: DimensionConstants.d374.w,
                                ),
                                TextFormField(
                                  obscureText: provider.isPasswordVisible,
                                  controller: provider.passwordController,
                                  decoration: ViewDecoration
                                      .inputDecorationWithCurvePassword(
                                    "password".tr(),
                                    ColorConstants.lightGrayColor,
                                  ),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Empty password';
                                    } else if (value.length < 6) {
                                      return 'Enter a password with length at least 6 letters';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: DimensionConstants.d4.h,
                                      left: DimensionConstants.d300.w),
                                  child: IconButton(
                                      onPressed: () {
                                        provider.visiblePassword();
                                      },
                                      icon: Icon(
                                        provider.isPasswordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: ColorConstants.blackColor,
                                      )),
                                ),
                              ],
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
                          GestureDetector(
                            onTap: () {
                              if (provider.formKey.currentState!.validate()) {
                                KeyboardHelper.hideKeyboard(context);
                                Navigator.of(context)
                                    .pushNamed(RoutesConstants.dashBoard);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: DimensionConstants.d20.h),
                              child: CustomShape(
                                  bgColor: ColorConstants.blackColor,
                                  radius: const BorderRadius.all(
                                      Radius.circular(DimensionConstants.d10)),
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
                                left: DimensionConstants.d69.w,
                                right: DimensionConstants.d69.w),
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
              );
            }));
  }
}
