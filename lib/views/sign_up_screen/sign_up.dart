import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/provider/sign_up_provider.dart';
import 'package:dog_app/views/base_view.dart';
import 'package:dog_app/widgets/custom_shape.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/decoration.dart';
import '../../constants/dimension_constants.dart';
import '../../constants/image_constants.dart';
import '../../constants/route_constants.dart';
import '../../enum/siningCharacter.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/image_view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpProvider>(
        onModelReady: (provider) {},
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: ColorConstants.whiteColor,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: Text("signUp".tr()).boldText(ColorConstants.whiteColor,
                  DimensionConstants.d25.sp, TextAlign.center),
              backgroundColor: ColorConstants.primaryColor,
              leading: Padding(
                padding: EdgeInsets.only(
                    top: DimensionConstants.d15.h,
                    bottom: DimensionConstants.d10.w,
                    left: DimensionConstants.d20.w),
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
            body: SingleChildScrollView(
              child: SafeArea(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          provider.fileBackground == ''
                              ? Container(
                                  height: DimensionConstants.d200.h,
                                  width: DimensionConstants.d414.w,
                                  color: ColorConstants.imageBackgroundColor,
                                )
                              : Container(
                                  height: DimensionConstants.d200.h,
                                  width: DimensionConstants.d414.w,
                                  color: ColorConstants.whiteColor,
                                  child: ImageView(
                                    width: DimensionConstants.d25.w,
                                    height: DimensionConstants.d25.h,
                                    path: provider.fileBackground,
                                    fit: BoxFit.fill,
                                  )),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CustomDialog(
                                        cameraClick: () {
                                          provider.getImageBackGround(
                                              context, 1);
                                        },
                                        galleryClick: () {
                                          provider.getImageBackGround(
                                              context, 2);
                                        },
                                        cancelClick: () {
                                          Navigator.of(context).pop();
                                        },
                                      ));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: DimensionConstants.d26.h,
                                  left: DimensionConstants.d368.w,
                                  right: DimensionConstants.d20.w),
                              child: const Material(
                                shape: const CircleBorder(),
                                elevation: DimensionConstants.d4,
                                child: ImageView(
                                  path: ImagesConstants.imagePicker,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: DimensionConstants.d150.w,
                                top: DimensionConstants.d140.h,
                                right: DimensionConstants.d151.w),
                            child: provider.fileProfile == ""
                                ? Material(
                                    shape: const CircleBorder(),
                                    elevation: DimensionConstants.d4,
                                    child: CircleAvatar(
                                      radius: DimensionConstants.d70.r,
                                      backgroundColor:
                                          ColorConstants.whiteColor,
                                    ),
                                  )
                                : Material(
                                    shape: const CircleBorder(),
                                    elevation: DimensionConstants.d4,
                                    child: CircleAvatar(
                                      radius: DimensionConstants.d70.r,
                                      child: ImageView(
                                        radius: DimensionConstants.d70.r,
                                        circleCrop: true,
                                        width: DimensionConstants.d126.w,
                                        height: DimensionConstants.d126.h,
                                        path: provider.fileProfile,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                          ),
                          Positioned(
                            top: DimensionConstants.d225.h,
                            right: DimensionConstants.d152.w,
                            left: DimensionConstants.d236.w,
                            child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomDialog(
                                            cameraClick: () {
                                              provider.getImageProfile(
                                                  context, 1);
                                            },
                                            galleryClick: () {
                                              provider.getImageProfile(
                                                  context, 2);
                                            },
                                            cancelClick: () {
                                              Navigator.of(context).pop();
                                            },
                                          ));
                                },
                                child: const Material(
                                  elevation: DimensionConstants.d4,
                                  shape: CircleBorder(),
                                  child: ImageView(
                                    path: ImagesConstants.imagePicker,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: DimensionConstants.d20.h),
                      CustomShape(
                        child: TextFormField(
                            controller: provider.dogNameController,
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
                            controller: provider.dogBreadController,
                            decoration: ViewDecoration.inputDecorationWithCurve(
                                "dogBread".tr(),
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
                      Padding(
                        padding:
                            EdgeInsets.only(right: DimensionConstants.d260.w),
                        child: Text("dogSex".tr()).regularText(
                            ColorConstants.blackColor,
                            DimensionConstants.d18.sp,
                            TextAlign.left),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: Text("dogMale".tr()).regularText(
                                  ColorConstants.blackColor,
                                  DimensionConstants.d18.sp,
                                  TextAlign.left),
                              leading: Radio<SingingCharacter>(
                                fillColor: MaterialStateProperty.all<Color>(
                                    ColorConstants.primaryColor),
                                value: SingingCharacter.Male,
                                groupValue: provider.character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    provider.character = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text("dogFemale".tr()).regularText(
                                  ColorConstants.blackColor,
                                  DimensionConstants.d18.sp,
                                  TextAlign.left),
                              leading: Radio<SingingCharacter>(
                                fillColor: MaterialStateProperty.all<Color>(
                                    ColorConstants.primaryColor),
                                value: SingingCharacter.Female,
                                groupValue: provider.character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    provider.character = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: DimensionConstants.d10.w,
                          )
                        ],
                      ),
                      CustomShape(
                        child: TextFormField(
                            onTap: () {
                              provider.selectAge(context);
                            },
                            controller: provider.datetime,
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
                            controller: provider.ownerNameController,
                            decoration: ViewDecoration.inputDecorationWithCurve(
                                "ownerName".tr(),
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
                            controller: provider.ownerSurnameController,
                            decoration: ViewDecoration.inputDecorationWithCurve(
                                "ownerSurname".tr(),
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
                            controller: provider.addressController,
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
                            controller: provider.phoneNumberController,
                            decoration: ViewDecoration.inputDecorationWithCurve(
                                "contactNumber".tr(),
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
                            controller: provider.whatsAppController,
                            decoration: ViewDecoration.inputDecorationWithCurve(
                                "whatsApp".tr(),
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
                            controller: provider.veterinaryNumberController,
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
                            controller: provider.ownerEmailController,
                            decoration: ViewDecoration.inputDecorationWithCurve(
                                "email".tr(), ColorConstants.lightGrayColor)),
                        bgColor: ColorConstants.lightGrayTextFiled,
                        radius: const BorderRadius.all(
                            Radius.circular(DimensionConstants.d15)),
                        height: DimensionConstants.d60.h,
                        width: DimensionConstants.d374.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RoutesConstants.verificationScreen);
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: DimensionConstants.d20.h),
                          child: CustomShape(
                              bgColor: ColorConstants.blackColor,
                              radius: const BorderRadius.all(
                                  Radius.circular(DimensionConstants.d15)),
                              height: DimensionConstants.d54.h,
                              width: DimensionConstants.d374.w,
                              child: Center(
                                child: Text("signUp".tr()).boldText(
                                    ColorConstants.whiteColor,
                                    DimensionConstants.d20.sp,
                                    TextAlign.center),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d65.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
