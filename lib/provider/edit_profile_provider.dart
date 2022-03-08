import 'dart:io';

import 'package:dog_app/provider/base_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/color_constants.dart';
import '../enum/siningCharacter.dart';

class EditProfileProvider extends BaseProvider {
  final datetime = TextEditingController();
  final dogNameController = TextEditingController();
  final dogBreadController = TextEditingController();
  final ownerNameController = TextEditingController();
  final ownerSurnameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final whatsAppController = TextEditingController();
  final veterinaryNumberController = TextEditingController();
  final ownerEmailController = TextEditingController();
  String fileBackground = '';
  String fileProfile = '';
  SingingCharacter? character = SingingCharacter.Male;

  checkBoxValue() {
    notifyListeners();
  }

  Future<void> selectAge(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime(2010),
      firstDate: DateTime(1950),
      lastDate: DateTime(2015),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorConstants.primaryColor,
              onPrimary: Colors.white,
              onSurface: ColorConstants.blackColor,
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(value!);
      datetime.text = formattedDate;
    });
  }

  Future getImageBackGround(BuildContext context, int type) async {
    Navigator.of(context).pop();

    final picker = ImagePicker();
    if (type == 1) {
      var pickedImage = await picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setImageBackground(File(pickedImage.path));
        //setImage(File(pickedImage.path));
      }
    } else {
      var pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setImageBackground(File(pickedImage.path));

        //setImage(File(pickedImage.path));
      }
    }
  }

  void setImageBackground(File image) {
    fileBackground = image.path.toString();
    print(fileBackground);
    notifyListeners();
  }

  Future getImageProfile(BuildContext context, int type) async {
    Navigator.of(context).pop();

    final picker = ImagePicker();
    if (type == 1) {
      var pickedImage = await picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setImageProfile(File(pickedImage.path));
        //setImage(File(pickedImage.path));
      }
    } else {
      var pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setImageProfile(File(pickedImage.path));

        //setImage(File(pickedImage.path));
      }
    }
  }

  void setImageProfile(File image) {
    fileProfile = image.path.toString();
    print(fileProfile);
    notifyListeners();
  }
}
