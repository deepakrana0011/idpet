import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/helper/keyboard_helper.dart';
import 'package:dog_app/provider/base_provider.dart';
import 'package:dog_app/provider/verify_code_provider.dart';
import 'package:dog_app/views/base_view.dart';
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

class VerificationCodeScreen extends StatefulWidget {
  String? email;
  bool forgotCode;

  VerificationCodeScreen({Key? key, this.email, required this.forgotCode}) : super(key: key);


  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  var inputCode;
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
      body: BaseView<VerificationProviders>(
          onModelReady: (provider) {
            },
          builder: (context, provider, _){

          return Center(
            child: SingleChildScrollView(
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
                    autofocus: false,
                    onEditing: (bool value) {},
                    onCompleted: (String value) {
                     inputCode = value;
                    },
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
                  ), provider.state == ViewState.Busy
                      ? Center(
                    child:  Padding(
                      padding: EdgeInsets.symmetric(vertical:DimensionConstants.d20.h),
                      child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              ColorConstants.primaryColor)),
                    ),):
                  GestureDetector(
                    onTap: () {
                     movetoNext(context, provider);
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
          );
        }
      ),
    );
  }
  movetoNext(BuildContext context, VerificationProviders provider) async {
    if(widget.forgotCode==true){
      KeyboardHelper.hideKeyboard(context);
      provider.verifyPasswordOtp (context ,widget.email!,int.parse(inputCode),widget.forgotCode);
    }else {KeyboardHelper.hideKeyboard(context);
      provider.verifyCode (context ,widget.email!,int.parse(inputCode),widget.forgotCode);
    }
  }
}
