import 'package:dog_app/constants/dimension_constants.dart';
import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/provider/dashboard_provider.dart';
import 'package:dog_app/provider/nfc_session.dart';
import 'package:dog_app/provider/nfc_write.dart';
import 'package:dog_app/views/base_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';

class NfcScan extends StatefulWidget {
  const NfcScan({Key? key}) : super(key: key);

  @override
  State<NfcScan> createState() => _NfcScanState();
}

class _NfcScanState extends State<NfcScan> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isAvailable = false;

  @override
  Widget build(BuildContext context) {
    final dashBoardProvider =
        Provider.of<DashboardProvider>(context, listen: false);
    return BaseView<NfcProvider>(onModelReady: (provider) async {
      await getReady(context, dashBoardProvider);
    }, builder: (context, provider, _) {
      return Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Container(),
        ),
      );
    });
  }

  getReady(context, DashboardProvider dashboardProvider) {
    NfcManager.instance.isAvailable().then((bool value) {
      setState(() {
        isAvailable = value;
      });
      if (isAvailable) {
        startSession(
          context: _scaffoldKey.currentContext!,
          handleTag: (tag) => Provider.of<NfcProvider>(
                  _scaffoldKey.currentContext!,
                  listen: false)
              .writeNdef(tag),
        ).then((value) {
          dashboardProvider.onItemTapped(0);
        });
      } else {
        dashboardProvider.onItemTapped(0);
       // Navigator.of(context).pushNamed(RoutesConstants.dashBoard);
        DialogHelper.showMessage(context, 'nfc_not_available'.tr());
      }
    });
  }
}
