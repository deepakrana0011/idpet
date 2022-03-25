import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/provider/create_new_password_provider.dart';
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
  String? email;

  CreatePassword({Key? key, this.email}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        body: BaseView<CreateNewPasswordProvider>(
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
                          padding: EdgeInsets.symmetric(
                              horizontal: DimensionConstants.d20.w),
                          child: Column(children: [
                            SizedBox(
                              height: DimensionConstants.d60.h,
                              child: TextFormField(
                                obscureText: provider.isPasswordVisible,
                                controller: provider.passwordController,
                                decoration: ViewDecoration
                                    .inputDecorationWithCurvePassword(
                                  "password".tr(),
                                  ColorConstants.lightGrayColor,
                                  radius: DimensionConstants.d15.r,
                                  suffixIcon: IconButton(
                                      splashRadius: DimensionConstants.d1.r,
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
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    DialogHelper.showMessage(
                                        context, 'empty_password'.tr());
                                  } else if (value.length < 6) {
                                    DialogHelper.showMessage(
                                        context, 'password_length_error'.tr());
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: DimensionConstants.d20.h,
                            ),
                            SizedBox(
                              height: DimensionConstants.d60.h,
                              child: TextFormField(
                                controller: provider.confirmPasswordController,
                                decoration:
                                    ViewDecoration.inputDecorationWithCurve(
                                  "confirmPassword".tr(),
                                  ColorConstants.lightGrayColor,
                                  radius: DimensionConstants.d15.r,
                                ),
                              ),
                            ),
                            provider.state == ViewState.Busy
                                ? Center(
                              child:  Padding(
                                padding: EdgeInsets.symmetric(vertical:DimensionConstants.d20.h),
                                child: const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        ColorConstants.primaryColor)),
                              ),):GestureDetector(
                              onTap: () {
                                movetoNext(context, provider);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: DimensionConstants.d30.h),
                                child: CustomShape(
                                    bgColor: ColorConstants.blackColor,
                                    radius: const BorderRadius.all(
                                        Radius.circular(
                                            DimensionConstants.d15)),
                                    height: DimensionConstants.d54.h,
                                    width: DimensionConstants.d374.w,
                                    child: Center(
                                      child: Text("resetPassword".tr())
                                          .boldText(
                                              ColorConstants.whiteColor,
                                              DimensionConstants.d20.sp,
                                              TextAlign.center),
                                    )),
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  movetoNext(BuildContext context, CreateNewPasswordProvider provider) async {
    if (provider.passwordController.text.isEmpty) {
      DialogHelper.showMessage(context, 'empty_password'.tr());
    } else if (provider.passwordController.text.length < 6) {
      DialogHelper.showMessage(context, 'password_length_error'.tr());
    } else if (provider.confirmPasswordController.text.isEmpty) {
      DialogHelper.showMessage(context, 'empty_password'.tr());
    }else if (provider.passwordController.text !=
        provider.confirmPasswordController.text) {
      DialogHelper.showMessage(context, "password_not_matched".tr());
    }  else {
      KeyboardHelper.hideKeyboard(context);
      provider.createNewPassword(
          context, widget.email!, provider.passwordController.text);
    }
  }
}
