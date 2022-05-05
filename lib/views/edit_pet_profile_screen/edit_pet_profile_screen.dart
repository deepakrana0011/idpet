
import 'package:dog_app/constants/api_constants.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/helper/date_functions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/keyboard_helper.dart';
import 'package:dog_app/model/getSinglePetDetailResponse.dart' as getSinglePet;
import 'package:dog_app/provider/edit_pet_profile_provider.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../constants/decoration.dart';
import '../../constants/dimension_constants.dart';
import '../../constants/image_constants.dart';
import '../../enum/siningCharacter.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_shape.dart';
import '../../widgets/image_view.dart';
import '../base_view.dart';

class EditPetProfileScreen extends StatefulWidget {
   EditPetProfileScreen({Key? key, required this.data}) : super(key: key);
   getSinglePet.Data? data;
  @override
  State<EditPetProfileScreen> createState() => _EditPetProfileScreenState();
}

class _EditPetProfileScreenState extends State<EditPetProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<EditPetProfileProvider>(onModelReady: (provider) {
      getUserInfo(context, provider);
      }, builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        appBar: AppBar(
          //centerTitle: true,
          elevation: 0,
          title: Text("editPetDetails".tr()).boldText(ColorConstants.whiteColor,
              DimensionConstants.d21.sp, TextAlign.center),
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
        body:
        provider.state == ViewState.Busy || widget.data == null

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
                              path:
                                  ApiConstant.BASE_URL +
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

  movetoNext(BuildContext context, EditPetProfileProvider provider) {
    if (provider.petNameController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_pet_name".tr());
    } else if (provider.petBreadController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_pet_breed".tr());
    } else if (provider.datetime.text.isEmpty) {
      DialogHelper.showMessage(context, "select_age".tr());
    } else if (provider.veterinaryNumberController.text.isEmpty) {
      DialogHelper.showMessage(context, "enter_chip_number".tr());
    } else if (provider.descriptionController.text.isEmpty) {
      DialogHelper.showMessage(context, "add_description".tr());
    } else {
      KeyboardHelper.hideKeyboard(context);
      provider.editpetProfileInfo(
        context,
        widget.data!.id,
        provider.petNameController.text,
        provider.gender.toString(),
        provider.petBreadController.text,
        provider.veterinaryNumberController.text,
        provider.dateMilisec,
        provider.imageFile ?? null,
        provider.bannerImage ?? null,
      );
    }
  }

 getUserInfo(BuildContext context, EditPetProfileProvider provider) {
    provider.character = widget.data!.petSex == "Maschio"
        ? SigningCharacter.Maschio
        : SigningCharacter.Femmina;
    provider.petBreadController.text = widget.data!.petBreed;
    provider.petNameController.text = widget.data!.petName;
    provider.descriptionController.text = widget.data!.description;
    provider.veterinaryNumberController.text = widget.data!.veterinaryNumber;
    provider.datetime.text = time(widget.data!.petBirthDate).toString();
    provider.dateMilisec = widget.data!.petBirthDate;
  }

}
