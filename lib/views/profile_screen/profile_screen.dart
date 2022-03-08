import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../constants/decoration.dart';
import '../../constants/dimension_constants.dart';
import '../../constants/image_constants.dart';
import '../../widgets/custom_shape.dart';
import '../../widgets/image_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("profile".tr()).boldText(ColorConstants.whiteColor,
              DimensionConstants.d25.sp, TextAlign.center),
          backgroundColor: ColorConstants.primaryColor,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesConstants.editProfile);
                },
                child: Padding(
                    padding: EdgeInsets.only(
                        bottom: DimensionConstants.d5.h,
                        right: DimensionConstants.d21.w),
                    child: const ImageView(
                      path: ImagesConstants.edit,
                    ))),
            GestureDetector(
              onTap: () {
                print("logoutTapped");
              },
              child: Padding(
                  padding: EdgeInsets.only(
                      bottom: DimensionConstants.d5.h,
                      right: DimensionConstants.d25.w),
                  child: const ImageView(
                    path: ImagesConstants.logOut,
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: DimensionConstants.d200.h,
                      width: DimensionConstants.d414.w,
                      color: ColorConstants.imageBackgroundColor,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: DimensionConstants.d145.h,
                            left: DimensionConstants.d135.w,
                            right: DimensionConstants.d144.w),
                        child: Material(
                          elevation: DimensionConstants.d4,
                          shape: const CircleBorder(),
                          child: CircleAvatar(
                            radius: DimensionConstants.d70.sp,
                            backgroundColor: ColorConstants.whiteColor,
                          ),
                        ))
                  ],
                ),
                SizedBox(height: DimensionConstants.d20.h),
                CustomShape(
                  child: TextFormField(
                      readOnly: true,
                      decoration: ViewDecoration.inputDecorationWithCurve(
                          "dogName".tr(), ColorConstants.lightGrayColor)),
                  bgColor: ColorConstants.lightGrayTextFiled,
                  radius: const BorderRadius.all(
                      Radius.circular(DimensionConstants.d15)),
                  height: DimensionConstants.d60.h,
                  width: DimensionConstants.d374.w,
                ),
                SizedBox(height: DimensionConstants.d20.h),
                CustomShape(
                  child: TextFormField(
                      readOnly: true,
                      decoration: ViewDecoration.inputDecorationWithCurve(
                          "dogBread".tr(), ColorConstants.lightGrayColor)),
                  bgColor: ColorConstants.lightGrayTextFiled,
                  radius: const BorderRadius.all(
                      Radius.circular(DimensionConstants.d15)),
                  height: DimensionConstants.d60.h,
                  width: DimensionConstants.d374.w,
                ),
                SizedBox(
                  height: DimensionConstants.d20.h,
                ),
                CustomShape(
                  child: TextFormField(
                      readOnly: true,
                      decoration: ViewDecoration.inputDecorationWithCurve(
                          "male".tr(), ColorConstants.lightGrayColor)),
                  bgColor: ColorConstants.lightGrayTextFiled,
                  radius: const BorderRadius.all(
                      Radius.circular(DimensionConstants.d15)),
                  height: DimensionConstants.d60.h,
                  width: DimensionConstants.d374.w,
                ),
                SizedBox(
                  height: DimensionConstants.d20.h,
                ),
                CustomShape(
                  child: TextFormField(
                      readOnly: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: ViewDecoration.inputDecorationWithCurve(
                          "age".tr(), ColorConstants.lightGrayColor)),
                  bgColor: ColorConstants.lightGrayTextFiled,
                  radius: const BorderRadius.all(
                      Radius.circular(DimensionConstants.d15)),
                  height: DimensionConstants.d60.h,
                  width: DimensionConstants.d374.w,
                ),
                SizedBox(
                  height: DimensionConstants.d20.h,
                ),
                CustomShape(
                  child: TextFormField(
                      readOnly: true,
                      decoration: ViewDecoration.inputDecorationWithCurve(
                          "ownerName".tr(), ColorConstants.lightGrayColor)),
                  bgColor: ColorConstants.lightGrayTextFiled,
                  radius: const BorderRadius.all(
                      Radius.circular(DimensionConstants.d15)),
                  height: DimensionConstants.d60.h,
                  width: DimensionConstants.d374.w,
                ),
                SizedBox(
                  height: DimensionConstants.d20.h,
                ),
                CustomShape(
                  child: TextFormField(
                      readOnly: true,
                      decoration: ViewDecoration.inputDecorationWithCurve(
                          "ownerSurname".tr(), ColorConstants.lightGrayColor)),
                  bgColor: ColorConstants.lightGrayTextFiled,
                  radius: const BorderRadius.all(
                      Radius.circular(DimensionConstants.d15)),
                  height: DimensionConstants.d60.h,
                  width: DimensionConstants.d374.w,
                ),
                SizedBox(
                  height: DimensionConstants.d20.h,
                ),
                CustomShape(
                  child: TextFormField(
                      readOnly: true,
                      decoration: ViewDecoration.inputDecorationWithCurve(
                          "address".tr(), ColorConstants.lightGrayColor)),
                  bgColor: ColorConstants.lightGrayTextFiled,
                  radius: const BorderRadius.all(
                      Radius.circular(DimensionConstants.d15)),
                  height: DimensionConstants.d60.h,
                  width: DimensionConstants.d374.w,
                ),
                SizedBox(
                  height: DimensionConstants.d20.h,
                ),
                CustomShape(
                  child: TextFormField(
                      readOnly: true,
                      decoration: ViewDecoration.inputDecorationWithCurve(
                          "contactNumber".tr(), ColorConstants.lightGrayColor)),
                  bgColor: ColorConstants.lightGrayTextFiled,
                  radius: const BorderRadius.all(
                      Radius.circular(DimensionConstants.d15)),
                  height: DimensionConstants.d60.h,
                  width: DimensionConstants.d374.w,
                ),
                SizedBox(
                  height: DimensionConstants.d20.h,
                ),
                CustomShape(
                  child: TextFormField(
                      readOnly: true,
                      decoration: ViewDecoration.inputDecorationWithCurve(
                          "whatsApp".tr(), ColorConstants.lightGrayColor)),
                  bgColor: ColorConstants.lightGrayTextFiled,
                  radius: const BorderRadius.all(
                      Radius.circular(DimensionConstants.d15)),
                  height: DimensionConstants.d60.h,
                  width: DimensionConstants.d374.w,
                ),
                SizedBox(
                  height: DimensionConstants.d20.h,
                ),
                CustomShape(
                  child: TextFormField(
                      readOnly: true,
                      decoration: ViewDecoration.inputDecorationWithCurve(
                          "veterinaryNumber".tr(),
                          ColorConstants.lightGrayColor)),
                  bgColor: ColorConstants.lightGrayTextFiled,
                  radius: const BorderRadius.all(
                      Radius.circular(DimensionConstants.d15)),
                  height: DimensionConstants.d60.h,
                  width: DimensionConstants.d374.w,
                ),
                SizedBox(
                  height: DimensionConstants.d20.h,
                ),
                CustomShape(
                  child: TextFormField(
                      readOnly: true,
                      decoration: ViewDecoration.inputDecorationWithCurve(
                          "email".tr(), ColorConstants.lightGrayColor)),
                  bgColor: ColorConstants.lightGrayTextFiled,
                  radius: const BorderRadius.all(
                      Radius.circular(DimensionConstants.d15)),
                  height: DimensionConstants.d60.h,
                  width: DimensionConstants.d374.w,
                ),
                SizedBox(
                  height: DimensionConstants.d50.h,
                )
              ],
            ),
          ),
        ));
  }
}
