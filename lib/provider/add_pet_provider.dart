import 'dart:io';

import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/enum/save_token.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/shared_pref.dart';
import 'package:dog_app/provider/base_provider.dart';
import 'package:dog_app/services/apiServices.dart';
import 'package:dog_app/services/fetchException.dart';
import 'package:dog_app/views/verifiction_code_screen/verification_code.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/color_constants.dart';
import '../enum/siningCharacter.dart';
import '../helper/date_functions.dart';
import '../locator.dart';

class SignUpProvider extends BaseProvider {
  final datetime = TextEditingController();
  final dogNameController = TextEditingController();
  final dogBreadController = TextEditingController();
  final ownerNameController = TextEditingController();
  final ownerSurnameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final whatsAppController = TextEditingController();
  final veterinaryNumberController = TextEditingController();
  final descriptionController =TextEditingController();
  final ownerEmailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;
  SaveToken saveToken = locator<SaveToken>();
  List date = [];
  List date2 = [];
  var dateTime;
  String fileBackground = '';
  String fileProfile = '';
  SigningCharacter? character = SigningCharacter.Male;
  String gender = "male";

  visiblePassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  File? imageFile;
  File? bannerImage;
  var dateMilisec;
  var status;

  //File? get imageFile => ImageFile;

  Future<bool> signUpUser(
      BuildContext context,
      String dogName,
      String dogSex,
      String dogBreed,
      String ownerName,
      String address,
      String contactPhone,
      String whatsapp,
      String email,
      String password,
      String vetenaryNumber,
      int dogBirthDate,
      File image,
      File bannerimage) async {
    setState(ViewState.Busy);
    try {
      var model = await api.signUp(
          dogName,
          dogSex,
          dogBreed,
          ownerName,
          descriptionController.text,
          ownerSurnameController.text,
          address,
          contactPhone,
          whatsapp,
          email,
          password,
          vetenaryNumber,
          dogBirthDate,
          image,
          bannerimage);
      if (model.success) {
        saveToken.registerToken = model.jwtToken.toString();
        SharedPref.prefs?.setString(SharedPref.DOG_BIRTH_DATE, selectedDate.toString());
        Navigator.of(context).pushNamed(RoutesConstants.verificationScreen,
            arguments: VerificationCodeScreen(email: email, forgotCode: false));
        DialogHelper.showMessage(context, model.message);
        print(model.data);
      } else {
        DialogHelper.showMessage(context, model.message);
      }
      setState(ViewState.Idle);
      return true;
    } on FetchDataException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, c.toString());
      return false;
    } on SocketException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, 'internet_connection'.tr());
      return false;
    }
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
    fileProfile = image.path.toString();
    notifyListeners();
  }

  void setImageBackground(File image) {
    bannerImage = image;
    fileBackground = image.path.toString();
    notifyListeners();
  }
}
