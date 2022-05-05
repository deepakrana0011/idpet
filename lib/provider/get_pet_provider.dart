import 'dart:io';

import 'package:dog_app/constants/api_constants.dart';
import 'package:dog_app/enum/save_token.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/helper/date_functions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/shared_pref.dart';
import 'package:dog_app/locator.dart';
import 'package:dog_app/model/getPetResponse.dart';
import 'package:dog_app/provider/base_provider.dart';
import 'package:dog_app/services/fetchException.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nfc_manager/nfc_manager.dart';

class GetPetHomeProvider extends BaseProvider {
 // SaveToken saveToken = locator<SaveToken>();
  var datetime;
  List <Data> data= [];
  Future<void> getPetDetail(BuildContext context) async {
    setState(ViewState.Busy);
    try {
      var model = await api.getPetDeatils();
      setState(ViewState.Idle);
      if (model.success) {
        data = (model.data);
        print(model);
      }
    } on FetchDataException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, c.toString());
    } on SocketException catch (c) {
      setState(ViewState.Idle);
      DialogHelper.showMessage(context, "internet_connection".tr());
    }
  }

  Future<String> writeNdef(NfcTag tag, String id) async {
    final tech = Ndef.from(tag);
    if (tech == null) throw ("tag_is_not_ndef".tr());
    if (!tech.isWritable) throw ('tag_is_not_writable'.tr());
    try {
      final message = NdefMessage(
          [//NdefRecord.createText("list"),
            NdefRecord.createUri(Uri.parse(ApiConstant.WEBURL+id)),
            // NdefRecord.createText("this is the new text")
          ]);
      await tech.write(message);
    } on PlatformException catch (e) {
      throw (e.message ?? 'error_occurred'.tr());
    }
    return 'write_complete'.tr();
  }

}
