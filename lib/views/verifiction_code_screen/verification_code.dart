import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

import '../../constants/color_constants.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../constants/dimension_constants.dart';
import '../../constants/image_constants.dart';
import '../../widgets/custom_shape.dart';
import '../../widgets/image_view.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Text("verificationCode".tr()).boldText(
                    ColorConstants.blackColor,
                    DimensionConstants.d30.sp,
                    TextAlign.center),
              ),
              SizedBox(
                height: DimensionConstants.d21.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: DimensionConstants.d22.w,
                    right: DimensionConstants.d200.w),
                child: Text("enterOtpCodeHere".tr()).regularText(
                    ColorConstants.blackColor,
                    DimensionConstants.d18.sp,
                    TextAlign.left),
              ),
              SizedBox(
                height: DimensionConstants.d60.h,
              ),
              VerificationCode(
                cursorColor: ColorConstants.whiteColor,
                autofocus: true,
                onEditing: (bool value) {},
                onCompleted: (String value) {},
                length: 4,
                underlineColor: ColorConstants.primaryColor,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: ColorConstants.blackColor,
                  fontSize: DimensionConstants.d30.sp,
                ),
                digitsOnly: true,
                underlineWidth: 3.w,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: DimensionConstants.d30.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RoutesConstants.dashBoard, (route) => false);
                },
                child: CustomShape(
                    bgColor: ColorConstants.blackColor,
                    radius: const BorderRadius.all(
                        Radius.circular(DimensionConstants.d10)),
                    height: DimensionConstants.d54.h,
                    width: DimensionConstants.d374.w,
                    child: Center(
                      child: Text("verifyNow".tr()).boldText(
                          ColorConstants.whiteColor,
                          DimensionConstants.d20.sp,
                          TextAlign.center),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
