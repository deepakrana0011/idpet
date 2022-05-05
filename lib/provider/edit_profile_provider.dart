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

class EditProfileProvider extends BaseProvider {
  final ownerNameController = TextEditingController();
  final ownerSurnameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final whatsAppController = TextEditingController();
  final ownerEmailController = TextEditingController();
  var status;
  Future<bool> editProfileInfo( BuildContext context,
      String ownerName,
      String address,
      String contactPhone,
      String whatsapp,
      String email,
    )async {


    setState(ViewState.Busy);

    try {
      var model = await api.editProfile(
          ownerName,
        ownerSurnameController.text,
          address,
          contactPhone,
          whatsapp,
          email,
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
