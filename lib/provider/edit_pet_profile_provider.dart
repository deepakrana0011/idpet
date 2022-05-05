import 'dart:io';

import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/helper/date_functions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/shared_pref.dart';
import 'package:dog_app/provider/base_provider.dart';
import 'package:dog_app/services/fetchException.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/color_constants.dart';
import '../enum/siningCharacter.dart';

class EditPetProfileProvider extends BaseProvider {
  final datetime = TextEditingController();
  final petNameController = TextEditingController();
  final petBreadController = TextEditingController();
  final veterinaryNumberController = TextEditingController();
  final descriptionController =TextEditingController();
  File? imageFile;
  File? bannerImage;
  var dateMilisec;
  var status;
  SigningCharacter? character = SigningCharacter.Maschio;
  String gender = "male".tr();

  checkBoxValue() {
    notifyListeners();
  }

  Future<void> selectAge(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
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
      String formattedDate = ddMMyyyy(value);
      datetime.text = formattedDate;
      selectedDate = value;
      int timestamp = selectedDate!.millisecondsSinceEpoch;
      var date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
      dateMilisec = date.millisecondsSinceEpoch;
      // print('$dateMilisec (milliseconds)');
    });
  }

  DateTime? selectedDate;
  File? bimage;
  Future getImageBackGround(BuildContext context, int type) async {
    Navigator.of(context).pop();

    final picker = ImagePicker();
    if (type == 1) {
      var pickedImage = await picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setImageBackground(File(pickedImage.path));
        bimage = File(pickedImage.path);
        notifyListeners();
        //setImage(File(pickedImage.path));
      }
    } else {
      var pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setImageBackground(File(pickedImage.path));
        bimage = File(pickedImage.path);
        notifyListeners();
        //setImage(File(pickedImage.path));
      }
    }
  }

  File? image;

  Future getImageProfile(BuildContext context, int type) async {
    Navigator.of(context).pop();

    final picker = ImagePicker();
    if (type == 1) {
      var pickedImage = await picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setImageProfile(File(pickedImage.path));
        image = File(pickedImage.path);
        notifyListeners();

        //setImage(File(pickedImage.path));
      }
    } else {
      var pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setImageProfile(File(pickedImage.path));
        image = File(pickedImage.path);
        notifyListeners();
        //setImage(File(pickedImage.path));
      }
    }
  }

  void setImageProfile(File image) {
    imageFile = image;
    notifyListeners();
  }

  void setImageBackground(File image) {
    bannerImage = image;
    notifyListeners();
  }
  Future<bool> editpetProfileInfo( BuildContext context,
      String petId,
      String petName,
      String petSex,
      String petBreed,
      String vetenaryNumber,
      int petBirthDate,
      File? image,
      File? bannerimage
      )async {
    setState(ViewState.Busy);
    try {
      var model = await api.editPetProfile(
        petId,
        petName,
        petSex,
        petBreed,
        descriptionController.text,
        vetenaryNumber,
        petBirthDate,
        image,
        bannerimage,
      );
      if(model.success){
        setState(ViewState.Idle);
        Navigator.pushNamedAndRemoveUntil(context, RoutesConstants.dashBoard, (Route<dynamic> route) => false);
        DialogHelper.showMessage(context, model.message);
        return true;
      }else{
        DialogHelper.showMessage(context, model.message);
        setState(ViewState.Idle);
        return false;
      }

    } on FetchDataException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, c.toString());
      return false;
    } on SocketException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, 'Internet connection');
      return false;
    }

  }
}
