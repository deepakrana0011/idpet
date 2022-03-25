import 'dart:io';

import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/enum/save_token.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/shared_pref.dart';
import 'package:dog_app/locator.dart';
import 'package:dog_app/provider/base_provider.dart';
import 'package:dog_app/services/fetchException.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerificationProviders extends BaseProvider {

  SaveToken saveToken = locator<SaveToken>();

  Future<bool> verifyCode(
      BuildContext context, String email, int code, bool forgotCode) async {
    setState(ViewState.Busy);

    try {
      var model = await api.verifyCode(email, code);
      if (model.success) {
        SharedPref.prefs
            ?.setString(SharedPref.JWTTOKEN, saveToken.registerToken);
        Navigator.pushNamedAndRemoveUntil(context, RoutesConstants.dashBoard,
                (Route<dynamic> route) => false);
        DialogHelper.showMessage(context, model.message);
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
      DialogHelper.showMessage(context, 'internet_connection');
      return false;
    }
  }

  Future<bool> verifyPasswordOtp(
      BuildContext context, String email, int code, bool forgotCode) async {
    setState(ViewState.Busy);
    try {
      var model = await api.verifyPasswordOtp(email, code);
      if (model.success) {
        Navigator.of(context).pushNamed(RoutesConstants.createPassword,arguments: email);
        DialogHelper.showMessage(context, model.message);
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
