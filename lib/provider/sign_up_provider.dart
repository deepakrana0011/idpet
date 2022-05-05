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
  final ownerNameController = TextEditingController();
  final ownerSurnameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final whatsAppController = TextEditingController();
  final ownerEmailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;
  SaveToken saveToken = locator<SaveToken>();
  var dateTime;

  visiblePassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  var status;

  //File? get imageFile => ImageFile;

  Future<bool> signUpUser(
      BuildContext context,
      String ownerName,
      String address,
      String contactPhone,
      String whatsapp,
      String email,
      String password,
      ) async {
    setState(ViewState.Busy);
    try {
      var model = await api.signUp(
        ownerName,
        ownerSurnameController.text,
          address,
          contactPhone,
          whatsapp,
          email,
          password,
         );
      if (model.success) {
        saveToken.registerToken = model.jwtToken.toString();
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
}
