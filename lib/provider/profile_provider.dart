import 'dart:io';

import 'package:dog_app/enum/save_token.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/helper/date_functions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/shared_pref.dart';
import 'package:dog_app/locator.dart';
import 'package:dog_app/model/getUserResponse.dart';
import 'package:dog_app/provider/base_provider.dart';
import 'package:dog_app/services/fetchException.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreenProvider extends BaseProvider {
  GetDetailsResponse? details;
  SaveToken saveToken = locator<SaveToken>();
  var datetime;
  Future<void> getProfileDetail(BuildContext context) async {
    setState(ViewState.Busy);
    try {
      var model = await api.getDeatils();
      details = model;
      setState(ViewState.Idle);
      if (model.success) {
        saveToken.id=model.data!.id;
      } else {}
    } on FetchDataException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, c.toString());
    } on SocketException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, "internet_connection".tr());
    }
  }

}
