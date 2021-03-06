import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/constants/validations.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/keyboard_helper.dart';
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

final _scaffoldkey = GlobalKey<ScaffoldState>();
final formKey = GlobalKey<FormState>();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpProvider>(
        onModelReady: (provider) {},
        builder: (context, provider, _) {
          return Scaffold(
            key: _scaffoldkey,
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: DimensionConstants.d20.w),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: DimensionConstants.d30.h,
                                ),
                                child: SizedBox(
                                  height: DimensionConstants.d66.h,
                                  width: DimensionConstants.d162.w,
                                  child: const ImageView(
                                    path: ImagesConstants.primaryImage,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: DimensionConstants.d30.h,
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
                                  keyboardType: TextInputType.phone,
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
                                  keyboardType: TextInputType.phone,
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
                              SizedBox(
                                height: DimensionConstants.d60.h,
                                child: TextFormField(
                                  obscureText: provider.isPasswordVisible,
                                  controller: provider.passwordController,
                                  decoration: ViewDecoration
                                      .inputDecorationWithCurvePassword(
                                    "password".tr(),
                                    Colors.transparent,
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
                                              child: Text("signUp".tr())
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

  movetoNext(BuildContext context, SignUpProvider provider) async {
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
    } else if (provider.passwordController.text.trim().isEmpty) {
      DialogHelper.showMessage(context, "empty_password".tr());
    } else if (provider.passwordController.text.length < 6) {
      DialogHelper.showMessage(context, 'password_length_error'.tr());
    } else {
      KeyboardHelper.hideKeyboard(context);
      provider.signUpUser(
        context,
        provider.ownerNameController.text,
        provider.addressController.text,
        provider.phoneNumberController.text,
        provider.whatsAppController.text,
        provider.ownerEmailController.text,
        provider.passwordController.text,
      );
    }
  }
}
