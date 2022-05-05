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

  movetoNext(BuildContext context, EditProfileProvider provider, ) {
    if (provider.ownerNameController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_name".tr());
    } else if (provider.ownerSurnameController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_surname".tr());
    } else if (provider.addressController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_address".tr());
    } else if (provider.phoneNumberController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_contact_number".tr());
    } else if (provider.whatsAppController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_contact_number".tr());
    } else if (provider.ownerEmailController.text.trim().isEmpty) {
      DialogHelper.showMessage(context, 'empty_email'.tr());
    } else if (!Validations.emailValidation(
        provider.ownerEmailController.text.trim())) {
      DialogHelper.showMessage(context, 'invalid_email'.tr());
    } else {
      KeyboardHelper.hideKeyboard(context);
      provider.editProfileInfo(
        context,
        provider.ownerNameController.text,
        provider.addressController.text,
        provider.phoneNumberController.text,
        provider.whatsAppController.text,
        provider.ownerEmailController.text,
      );
    }
  }

  getUserInfo(BuildContext context, EditProfileProvider provider) {
    provider.ownerEmailController.text = widget.data!.email;
    provider.ownerNameController.text = widget.data!.ownerName;
    provider.ownerSurnameController.text = widget.data!.ownerSurname;
    provider.addressController.text = widget.data!.address;
    provider.phoneNumberController.text = widget.data!.contactPhone;
    provider.whatsAppController.text = widget.data!.whatsapp;
  }
}
