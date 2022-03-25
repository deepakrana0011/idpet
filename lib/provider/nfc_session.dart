import 'dart:io';

import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/constants/dimension_constants.dart';
import 'package:dog_app/constants/image_constants.dart';
import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/provider/dashboard_provider.dart';
import 'package:dog_app/views/base_view.dart';
import 'package:dog_app/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';

Future<void> startSession({
  required BuildContext context,
  required Future<String?> Function(NfcTag) handleTag,
  String alertMessage = "Hold your device near the item",
}) async {
  if (!(await NfcManager.instance.isAvailable())) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => UnavailableDialog());
  }

  if (Platform.isAndroid) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AndroidSessionDialog(alertMessage, handleTag));
  }

  if (Platform.isIOS)
    return NfcManager.instance.startSession(
      alertMessage: alertMessage,
      onDiscovered: (tag) async {
        try {
          final result = await handleTag(tag);
          if (result == null) return;
          await NfcManager.instance.stopSession(alertMessage: result);
        } catch (e) {
          await NfcManager.instance.stopSession(errorMessage: '$e');
        }
      },
    );

  throw ('unsupported platform: ${Platform.operatingSystem}');
}

class UnavailableDialog extends StatelessWidget {
  bool onwillpop = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      title: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: ColorConstants.primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('error'.tr()).mediumText(ColorConstants.whiteColor,
                DimensionConstants.d11.sp, TextAlign.center)
          ],
        ),
      ),
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageView(
                  path: ImagesConstants.nfcScanner,
                  height: DimensionConstants.d50.h,
                  width: DimensionConstants.d50.w,
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0.h),
                child: Text('nfc_not_support_or_temp_off.'.tr()).mediumText(
                    ColorConstants.textGrayColor,
                    DimensionConstants.d14.sp,
                    TextAlign.center)),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamedAndRemoveUntil(context,
                RoutesConstants.dashBoard, (Route<dynamic> route) => false);
          },
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r)),
                color: ColorConstants.lightGrayColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('got_it'.tr()).mediumText(ColorConstants.textGrayColor,
                    DimensionConstants.d14.sp, TextAlign.center),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class AndroidSessionDialog extends StatefulWidget {
  const AndroidSessionDialog(this.alertMessage, this.handleTag);

  final String alertMessage;
  final Future<String?> Function(NfcTag tag) handleTag;

  @override
  State<StatefulWidget> createState() => AndroidSessionDialogState();
}

class AndroidSessionDialogState extends State<AndroidSessionDialog> {
  String? _alertMessage;

  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    NfcManager.instance.startSession(
      onDiscovered: (tag) async {
        try {
          final result = await widget.handleTag(tag);
          if (result == null) return;
          await NfcManager.instance.stopSession();
          setState(() => _alertMessage = result);
        } catch (e) {
          await NfcManager.instance.stopSession().catchError((_) {
            /* no op */
          });
          setState(() => _errorMessage = '$e');
        }
      },
    ).catchError((e) => setState(() => _errorMessage = '$e'));
  }

  @override
  void dispose() {
    NfcManager.instance.stopSession().catchError((_) {
      /* no op */
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      title: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: ColorConstants.whiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_errorMessage?.isNotEmpty == true
                    ? 'error'.tr()
                    : _alertMessage?.isNotEmpty == true
                        ? 'success'.tr()
                        : 'ready_to_scan'.tr())
                .boldText(ColorConstants.blackColor, DimensionConstants.d25.sp,
                    TextAlign.center)
          ],
        ),
      ),
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageView(
                  path: ImagesConstants.nfcScanner,
                  height: DimensionConstants.d80.h,
                  width: DimensionConstants.d80.w,
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 0.h),
              child: Text(_errorMessage?.isNotEmpty == true
                      ? _errorMessage!
                      : _alertMessage?.isNotEmpty == true
                          ? _alertMessage!
                          : widget.alertMessage)
                  .boldText(ColorConstants.blackColor,
                      DimensionConstants.d20.sp, TextAlign.center),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            // Navigator.pushNamedAndRemoveUntil(context, RoutesConstants.dashBoard,
            //         (Route<dynamic> route) => false);
            Navigator.of(context).pop();
          },
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                color: ColorConstants.whiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _errorMessage?.isNotEmpty == true
                      ? "got_it".tr()
                      : _alertMessage?.isNotEmpty == true
                          ? 'ok'.tr()
                          : 'cancel'.tr(),
                ).boldText(ColorConstants.blackColor, DimensionConstants.d20.sp,
                    TextAlign.center)
              ],
            ),
          ),
        )
      ],
    );
  }
}
