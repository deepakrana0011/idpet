import 'package:dog_app/constants/api_constants.dart';
import 'package:dog_app/constants/validations.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/helper/date_functions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/keyboard_helper.dart';
import 'package:dog_app/model/getUserResponse.dart';
import 'package:dog_app/provider/edit_profile_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../constants/decoration.dart';
import '../../constants/dimension_constants.dart';
import '../../constants/image_constants.dart';
import '../../constants/route_constants.dart';
import '../../enum/siningCharacter.dart';
import '../../provider/sign_up_provider.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_shape.dart';
import '../../widgets/image_view.dart';
import '../base_view.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key, required this.data}) : super(key: key);
  Data? data;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<EditProfileProvider>(onModelReady: (provider) {
      getUserInfo(context, provider);
    }, builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text("editProfile".tr()).boldText(ColorConstants.whiteColor,
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
        body: provider.state == ViewState.Busy || widget.data == null
            ? const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        ColorConstants.primaryColor)),
              )
            : SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            provider.bannerImage == null
                                ? Container(
                                    height: DimensionConstants.d200.h,
                                    width: DimensionConstants.d414.w,
                                    color: ColorConstants.imageBackgroundColor,
                                    child: ImageView(
                                      path: ApiConstant.BASE_URL +
                                          widget.data!.bannerImage,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    height: DimensionConstants.d200.h,
                                    width: DimensionConstants.d414.w,
                                    color: ColorConstants.whiteColor,
                                    child: ImageView(
                                      width: DimensionConstants.d25.w,
                                      height: DimensionConstants.d25.h,
                                      file: provider.bannerImage,
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
                                  elevation: DimensionConstants.d4,
                                  shape: CircleBorder(),
                                  child: ImageView(
                                    path: ImagesConstants.imagePicker,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: DimensionConstants.d135.w,
                                  top: DimensionConstants.d145.h,
                                  right: DimensionConstants.d135.w),
                              child: provider.imageFile == null
                                  ? Material(
                                      shape: const CircleBorder(),
                                      elevation: DimensionConstants.d4,
                                      child: CircleAvatar(
                                        radius: DimensionConstants.d70.r,
                                        child: ImageView(
                                          radius: DimensionConstants.d70.r,
                                          circleCrop: true,
                                          width: DimensionConstants.d141.w,
                                          height: DimensionConstants.d141.h,
                                          path: ApiConstant.BASE_URL +
                                              widget.data!.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : Material(
                                      shape: const CircleBorder(),
                                      elevation: DimensionConstants.d4,
                                      child: CircleAvatar(
                                        radius: DimensionConstants.d70.sp,
                                        child: ImageView(
                                          radius: DimensionConstants.d70.sp,
                                          circleCrop: true,
                                          width: DimensionConstants.d141.w,
                                          height: DimensionConstants.d141.h,
                                          file: provider.imageFile,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                            ),
                            Positioned(
                              top: DimensionConstants.d235.h,
                              right: DimensionConstants.d130.w,
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
                                  controller: provider.dogNameController,
                                  decoration:
                                      ViewDecoration.inputDecorationWithCurve(
                                    "dogName".tr(),
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
                                  controller: provider.dogBreadController,
                                  decoration:
                                      ViewDecoration.inputDecorationWithCurve(
                                    "dogBread".tr(),
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
                                    right: DimensionConstants.d260.w),
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
                                      leading: Radio<SigningCharacter>(
                                        fillColor:
                                            MaterialStateProperty.all<Color>(
                                                ColorConstants.primaryColor),
                                        value: SigningCharacter.Male,
                                        groupValue: provider.character,
                                        onChanged: (SigningCharacter? value) {
                                          setState(() {
                                            provider.character = value;
                                            provider.gender = "male".tr();
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
                                      leading: Radio<SigningCharacter>(
                                        fillColor:
                                            MaterialStateProperty.all<Color>(
                                                ColorConstants.primaryColor),
                                        value: SigningCharacter.Female,
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
                                  SizedBox(
                                    width: DimensionConstants.d10.w,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: DimensionConstants.d60.h,
                                child: TextFormField(
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
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: provider.ownerNameController,
                                  decoration:
                                      ViewDecoration.inputDecorationWithCurve(
                                    "ownerName".tr(),
                                    Colors.transparent,
                                    radius: DimensionConstants.d15.r,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: DimensionConstants.d20.h,
                              ),
                              SizedBox(
                                height: DimensionConstants.d60.h,
                                child: TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: provider.ownerSurnameController,
                                  decoration:
                                      ViewDecoration.inputDecorationWithCurve(
                                    "ownerSurname".tr(),
                                    Colors.transparent,
                                    radius: DimensionConstants.d15.r,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: DimensionConstants.d20.h,
                              ),
                              SizedBox(
                                height: DimensionConstants.d60.h,
                                child: TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: provider.addressController,
                                  decoration:
                                      ViewDecoration.inputDecorationWithCurve(
                                    "address".tr(),
                                    Colors.transparent,
                                    radius: DimensionConstants.d15.r,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: DimensionConstants.d20.h,
                              ),
                              SizedBox(
                                height: DimensionConstants.d60.h,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: provider.phoneNumberController,
                                  decoration:
                                      ViewDecoration.inputDecorationWithCurve(
                                    "contactNumber".tr(),
                                    Colors.transparent,
                                    radius: DimensionConstants.d15.r,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: DimensionConstants.d20.h,
                              ),
                              SizedBox(
                                height: DimensionConstants.d60.h,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: provider.whatsAppController,
                                  decoration:
                                      ViewDecoration.inputDecorationWithCurve(
                                    "whatsApp".tr(),
                                    Colors.transparent,
                                    radius: DimensionConstants.d15.r,
                                  ),
                                ),
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
                              SizedBox(
                                height: DimensionConstants.d20.h,
                              ),
                              SizedBox(
                                height: DimensionConstants.d60.h,
                                child: TextFormField(
                                  readOnly: true,
                                  controller: provider.ownerEmailController,
                                  decoration:
                                      ViewDecoration.inputDecorationWithCurve(
                                    "email".tr(),
                                    Colors.transparent,
                                    radius: DimensionConstants.d15.r,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: DimensionConstants.d20.h,
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
                                              child: Text("done".tr()).boldText(
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
      );
    });
  }

  movetoNext(BuildContext context, EditProfileProvider provider) {
    if (provider.dogNameController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_dog_name".tr());
    } else if (provider.dogBreadController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_dog_breed".tr());
    } else if (provider.datetime.text.isEmpty) {
      DialogHelper.showMessage(context, "select_age".tr());
    } else if (provider.ownerNameController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_name".tr());
    } else if (provider.ownerSurnameController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_surname".tr());
    } else if (provider.addressController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_address".tr());
    } else if (provider.phoneNumberController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_contact_number".tr());
    } else if (provider.whatsAppController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_contact_number".tr());
    } else if (provider.veterinaryNumberController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_chip_number".tr());
    } else if (provider.descriptionController.text.isEmpty) {
      DialogHelper.showMessage(context, "add_description".tr());
    } else if (provider.ownerEmailController.text.trim().isEmpty) {
      DialogHelper.showMessage(context, 'empty_email'.tr());
    } else if (!Validations.emailValidation(
        provider.ownerEmailController.text.trim())) {
      DialogHelper.showMessage(context, 'invalid_email'.tr());
    } else {
      KeyboardHelper.hideKeyboard(context);
      provider.editProfileInfo(
        context,
        provider.dogNameController.text,
        provider.gender.toString(),
        provider.dogBreadController.text,
        provider.ownerNameController.text,
        provider.addressController.text,
        provider.phoneNumberController.text,
        provider.whatsAppController.text,
        provider.ownerEmailController.text,
        provider.veterinaryNumberController.text,
        provider.dateMilisec,
        provider.imageFile ?? null,
        provider.bannerImage ?? null,
      );
    }
  }

  getUserInfo(BuildContext context, EditProfileProvider provider) {
    provider.character = widget.data!.dogSex == "Male"
        ? SigningCharacter.Male
        : SigningCharacter.Female;
    provider.dogBreadController.text = widget.data!.dogBreed;
    provider.dogNameController.text = widget.data!.dogName;
    provider.ownerEmailController.text = widget.data!.email;
    provider.ownerNameController.text = widget.data!.ownerName;
    provider.ownerSurnameController.text = widget.data!.ownerSurname;
    provider.descriptionController.text = widget.data!.description;
    provider.addressController.text = widget.data!.address;
    provider.phoneNumberController.text = widget.data!.contactPhone;
    provider.whatsAppController.text = widget.data!.whatsapp;
    provider.veterinaryNumberController.text = widget.data!.veterinaryNumber;
    provider.datetime.text = time(widget.data!.dogBirthDate).toString();
    provider.dateMilisec = widget.data!.dogBirthDate;
  }
}
