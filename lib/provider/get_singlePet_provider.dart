import 'dart:io';

import 'package:dog_app/enum/save_token.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/helper/date_functions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/shared_pref.dart';
import 'package:dog_app/locator.dart';
import 'package:dog_app/model/getSinglePetDetailResponse.dart';
import 'package:dog_app/provider/base_provider.dart';
import 'package:dog_app/services/fetchException.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class GetSinglePetProvider extends BaseProvider {
//  SaveToken saveToken = locator<SaveToken>();
  var datetime;
  Data? Details;
  Future<void> getSinglePetDetail(BuildContext context ,String id) async {
    setState(ViewState.Busy);
    try {
      var model = await api.getSinglePetDeatils(id);
      setState(ViewState.Idle);
      if (model.success) {
        Details = model.data;
        datetime= getDateDiffInYears(model.data!.petBirthDate);
        SharedPref.prefs
            ?.setInt(SharedPref.PET_BIRTH_DATE, model.data!.petBirthDate);
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