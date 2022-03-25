

import 'package:dog_app/constants/api_constants.dart';
import 'package:dog_app/enum/save_token.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/locator.dart';
import 'package:dog_app/provider/base_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_manager/nfc_manager.dart';


class NfcProvider extends BaseProvider{
  SaveToken saveToken = locator<SaveToken>();
  Future<String> writeNdef(NfcTag tag) async {
    var id = saveToken.id;
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

