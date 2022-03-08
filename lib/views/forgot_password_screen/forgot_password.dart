import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/constants/dimension_constants.dart';
import 'package:dog_app/constants/image_constants.dart';
import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/provider/forgot_password_provider.dart';
import 'package:dog_app/views/base_view.dart';
import 'package:dog_app/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

import '../../constants/decoration.dart';
import '../../constants/string_Constants.dart';
import '../../constants/validations.dart';
import '../../helper/keyboard_helper.dart';
import '../../widgets/custom_shape.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordProvider>(
        onModelReady: (provider) {},
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: ColorConstants.whiteColor,
            appBar: AppBar(
              backgroundColor: ColorConstants.primaryColor,
              leading: Padding(
                padding: EdgeInsets.only(left: DimensionConstants.d20.w),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const ImageView(
                    path: ImagesConstants.backArrow,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: Center(
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: DimensionConstants.d36.h),
                        child: const ImageView(
                          path: ImagesConstants.primaryImage,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: DimensionConstants.d50.h),
                        child: Text("forgotPassword".tr()).boldText(
                            ColorConstants.blackColor,
                            DimensionConstants.d30.sp,
                            TextAlign.center),
                      ),
                      SizedBox(
                        height: DimensionConstants.d21.h,
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
                        height: DimensionConstants.d30.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (provider.formKey.currentState!.validate()) {
                            KeyboardHelper.hideKeyboard(context);
                            Navigator.of(context)
                                .pushNamed(RoutesConstants.createPassword);
                          }
                        },
                        child: CustomShape(
                            bgColor: ColorConstants.blackColor,
                            radius: const BorderRadius.all(
                                Radius.circular(DimensionConstants.d10)),
                            height: DimensionConstants.d54.h,
                            width: DimensionConstants.d374.w,
                            child: Center(
                              child: Text("sendVerificationCode".tr()).boldText(
                                  ColorConstants.whiteColor,
                                  DimensionConstants.d20.sp,
                                  TextAlign.center),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
