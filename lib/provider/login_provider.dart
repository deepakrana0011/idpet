import 'dart:io';

import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/enum/save_token.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/shared_pref.dart';
import 'package:dog_app/locator.dart';
import 'package:dog_app/provider/base_provider.dart';
import 'package:dog_app/services/fetchException.dart';
import 'package:dog_app/views/verifiction_code_screen/verification_code.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends BaseProvider {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;
  SaveToken saveToken= locator<SaveToken>();
  visiblePassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
  Future<void> login(
      BuildContext context, String email, String password) async {
    setState(ViewState.Busy);
    try {
      var model = await api.login(email, password);
      if (model.success) {
        saveToken.registerToken = model.jwtToken.toString();
       // saveToken.id=model.data!.id;
        SharedPref.prefs?.setString(SharedPref.ID, model.data!.id);
        if(model.data!.verifyStatus == 1) {
          SharedPref.prefs?.setString(SharedPref.JWTTOKEN, model.jwtToken!);
          SharedPref.prefs
              ?.setInt(SharedPref.VERIFY_STATUS, model.data!.verifyStatus);
          Navigator.pushNamedAndRemoveUntil(context, RoutesConstants.dashBoard, (Route<dynamic> route) => false);
           DialogHelper.showMessage(
            context, model.message);
        }else{
          Navigator.of(context).pushNamed(RoutesConstants.verificationScreen, arguments: VerificationCodeScreen(email:email,forgotCode: false));
          DialogHelper.showMessage(
              context, ("otp_sent".tr()));
          setState(ViewState.Idle);
        }

      } else {
        DialogHelper.showMessage(
            context, model.message);
        setState(ViewState.Idle);
      }
    } on FetchDataException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, c.toString());
    } on SocketException catch (e) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, 'internet_connection'.tr());
    }
  }
}
