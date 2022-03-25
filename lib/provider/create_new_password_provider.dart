import 'dart:io';

import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/provider/base_provider.dart';
import 'package:dog_app/services/fetchException.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class CreateNewPasswordProvider extends BaseProvider {
  bool isPasswordVisible = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  visiblePassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
  Future<void> createNewPassword(
      BuildContext context, String email, String password) async {
    setState(ViewState.Busy);

    try {
      var model = await api.resetPassword(email, password);
      if (model.success) {
        Navigator.pushNamedAndRemoveUntil(context, RoutesConstants.logInScreen,  (Route<dynamic> route) => false);
        DialogHelper.showMessage(
            context, model.message);
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

