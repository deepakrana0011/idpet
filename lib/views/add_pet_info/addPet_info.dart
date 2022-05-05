import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/constants/validations.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/keyboard_helper.dart';
import 'package:dog_app/provider/add_pet_provider.dart';
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

class AddPetInfo extends StatefulWidget {
  const AddPetInfo({Key? key}) : super(key: key);

  @override
  State<AddPetInfo> createState() => _AddPetInfoState();
}

class _AddPetInfoState extends State<AddPetInfo> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  BaseView<AddPetProvider>(
        onModelReady: (provider) {},
        builder: (context, provider, _) {
          return Scaffold(
            key: _scaffoldkey,
            backgroundColor: ColorConstants.whiteColor,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: Text("addDetails".tr()).boldText(ColorConstants.whiteColor,
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
                  child: Form(
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
                                  fit: BoxFit.cover,
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
                                  left: DimensionConstants.d135.w,
                                  top: DimensionConstants.d140.h,
                                  right: DimensionConstants.d135.w),
                              child: provider.fileProfile == ""
                                  ? Material(
                                shape: const CircleBorder(),
                                elevation: DimensionConstants.d4,
                                child: CircleAvatar(
                                  radius: DimensionConstants.d70.r,
                                  backgroundColor:
                                  ColorConstants.lightGrayTextFiled,
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
                                      width: DimensionConstants.d140.w,
                                      height: DimensionConstants.d140.h,
                                      path: provider.fileProfile,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                            Positioned(
                              top: DimensionConstants.d235.h,
                              right: DimensionConstants.d138.w,
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: DimensionConstants.d20.w),
                          child: Column(
                            children: [
                              SizedBox(height: DimensionConstants.d20.h),
                              SizedBox(
                                height: DimensionConstants.d60.h,
                                child: TextFormField(
                                  textCapitalization:
                                  TextCapitalization.sentences,
                                  controller: provider.petNameController,
                                  decoration:
                                  ViewDecoration.inputDecorationWithCurve(
                                    "petName".tr(),
                                    Colors.transparent,
                                    radius: DimensionConstants.d15.r,
                                  ),
                                ),
                              ),
                              SizedBox(height: DimensionConstants.d20.h),
                              SizedBox(
                                height: DimensionConstants.d60.h,
                                child: TextFormField(
                                  textCapitalization:
                                  TextCapitalization.sentences,
                                  controller: provider.petBreadController,
                                  decoration:
                                  ViewDecoration.inputDecorationWithCurve(
                                    "petBread".tr(),
                                    Colors.transparent,
                                    radius: DimensionConstants.d15.r,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: DimensionConstants.d20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: DimensionConstants.d240.w),
                                child: Text("petSex".tr()).regularText(
                                    ColorConstants.blackColor,
                                    DimensionConstants.d18.sp,
                                    TextAlign.left),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text("petMale".tr()).regularText(
                                          ColorConstants.blackColor,
                                          DimensionConstants.d18.sp,
                                          TextAlign.left),
                                      leading: Radio<SigningCharacter>(
                                        fillColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorConstants.primaryColor),
                                        value: SigningCharacter.Maschio,
                                        groupValue: provider.character,
                                        onChanged: (SigningCharacter? value) {
                                          setState(() {
                                            provider.character = value;
                                            provider.gender = "male".tr();
                                            // if (value!.index == 0) {
                                            //   provider.gender = "male".tr();
                                            // } else {
                                            //   provider.gender = "female".tr();
                                            // }
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text("petFemale".tr()).regularText(
                                          ColorConstants.blackColor,
                                          DimensionConstants.d18.sp,
                                          TextAlign.left),
                                      leading: Radio<SigningCharacter>(
                                        fillColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorConstants.primaryColor),
                                        value: SigningCharacter.Femmina,
                                        groupValue: provider.character,
                                        onChanged: (SigningCharacter? value) {
                                          setState(() {
                                            provider.character = value;
                                            provider.gender = "female".tr();
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: DimensionConstants.d60.h,
                                child: TextFormField(
                                    textCapitalization:
                                    TextCapitalization.sentences,
                                    onTap: () {
                                      provider.selectAge(context);
                                    },
                                    controller: provider.datetime,
                                    readOnly: true,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    decoration:
                                    ViewDecoration.inputDecorationWithCurve(
                                      "age".tr(),
                                      Colors.transparent,
                                      radius: DimensionConstants.d15.r,
                                    )),
                              ),
                              SizedBox(
                                height: DimensionConstants.d20.h,
                              ),
                              SizedBox(
                                height: DimensionConstants.d60.h,
                                child: TextFormField(
                                  controller:
                                  provider.veterinaryNumberController,
                                  decoration:
                                  ViewDecoration.inputDecorationWithCurve(
                                    "chipNumber".tr(),
                                    Colors.transparent,
                                    radius: DimensionConstants.d15.r,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: DimensionConstants.d20.h,
                              ),
                              SizedBox(
                                height: DimensionConstants.d110.h,
                                child: TextFormField(
                                  maxLines: 3,
                                  textCapitalization:
                                  TextCapitalization.sentences,
                                  controller: provider.descriptionController,
                                  decoration:
                                  ViewDecoration.inputDecorationWithCurve(
                                    "Note_and_info".tr(),
                                    Colors.transparent,
                                    radius: DimensionConstants.d15.r,
                                  ),
                                ),
                              ),
                              provider.state == ViewState.Busy
                                  ? Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: DimensionConstants.d20.h),
                                  child: const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<
                                          Color>(
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
                                      radius: BorderRadius.all(
                                          Radius.circular(
                                              DimensionConstants.d10.r)),
                                      height: DimensionConstants.d54.h,
                                      width: DimensionConstants.d374.w,
                                      child: Center(
                                        child: Text("done".tr())
                                            .boldText(
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  movetoNext(BuildContext context, AddPetProvider provider) async {
    if (provider.imageFile == null) {
      DialogHelper.showMessage(context, "select_profile_image".tr());
    } else if (provider.bannerImage == null) {
      DialogHelper.showMessage(context, "select_background_image".tr());
    } else if (provider.petNameController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_pet_name".tr());
    } else if (provider.petBreadController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_pet_breed".tr());
    } else if (provider.datetime.text.isEmpty) {
      DialogHelper.showMessage(context, "select_age".tr());
    } else if (provider.veterinaryNumberController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_chip_number".tr());
    }else if (provider.descriptionController.text.isEmpty) {
      DialogHelper.showMessage(context, "add_description".tr());
    }
   else {
      KeyboardHelper.hideKeyboard(context);
      provider.Addpet(
        context,
        provider.petNameController.text,
        provider.gender.toString(),
        provider.petBreadController.text,
        provider.veterinaryNumberController.text,
        provider.dateMilisec,
        provider.imageFile!,
        provider.bannerImage!,
      );
    }
  }
}
