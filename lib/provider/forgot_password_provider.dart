import 'dart:io';

import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/provider/base_provider.dart';
import 'package:dog_app/services/fetchException.dart';
import 'package:dog_app/views/verifiction_code_screen/verification_code.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordProvider extends BaseProvider {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future<bool> forgotpassword(BuildContext context, String email) async {
    setState(ViewState.Busy);
    try {
      var model = await api.forgotPassword(context, email);
      if (model.success == true) {

        Navigator.of(context).pushNamed(RoutesConstants.verificationScreen, arguments: VerificationCodeScreen(email:email, forgotCode: true,));
        DialogHelper.showMessage(context,  model.message);
        setState(ViewState.Idle);
        return true;
      } else {
        setState(ViewState.Idle);
        DialogHelper.showMessage(context, model.message);

        return false;
      }
    } on FetchDataException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, c.toString());
      return false;
    } on SocketException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, 'internet_connection');
      return false;
    }
  }
}
