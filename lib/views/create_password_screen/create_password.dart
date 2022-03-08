import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/provider/create_password_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/decoration.dart';
import '../../constants/dimension_constants.dart';
import '../../constants/image_constants.dart';
import '../../constants/route_constants.dart';
import '../../constants/string_Constants.dart';
import '../../helper/keyboard_helper.dart';
import '../../widgets/custom_shape.dart';
import '../../widgets/image_view.dart';
import '../base_view.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        body: BaseView<CreatePasswordProvider>(
            onModelReady: (provider) {},
            builder: (context, provider, _) {
              return SafeArea(
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
                            child: Text("createPassword".tr()).boldText(
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
                        SizedBox(
                          height: DimensionConstants.d20.h,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: DimensionConstants.d20.w),
                          child: Stack(
                            children: <Widget>[
                              CustomShape(
                                bgColor: ColorConstants.lightGrayTextFiled,
                                radius: const BorderRadius.all(
                                    Radius.circular(DimensionConstants.d15)),
                                width: DimensionConstants.d374.w,
                                height: DimensionConstants.d60.h,
                              ),
                              TextFormField(
                                controller: provider.confirmPasswordController,
                                decoration:
                                    ViewDecoration.inputDecorationWithCurve(
                                        "confirmPassword".tr(),
                                        ColorConstants.lightGrayColor),
                                validator: (value) {
                                  if (provider.passwordController.text !=
                                      provider.confirmPasswordController.text) {
                                    return ("Password not matched");
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (provider.formKey.currentState!.validate()) {
                              KeyboardHelper.hideKeyboard(context);
                              Navigator.of(context)
                                  .pushNamed(RoutesConstants.dashBoard);
                            }
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: DimensionConstants.d30.h),
                            child: CustomShape(
                                bgColor: ColorConstants.blackColor,
                                radius: const BorderRadius.all(
                                    Radius.circular(DimensionConstants.d15)),
                                height: DimensionConstants.d54.h,
                                width: DimensionConstants.d374.w,
                                child: Center(
                                  child: Text("resetPassword".tr()).boldText(
                                      ColorConstants.whiteColor,
                                      DimensionConstants.d20.sp,
                                      TextAlign.center),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
