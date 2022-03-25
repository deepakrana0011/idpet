import 'package:dog_app/constants/dimension_constants.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/views/home_screen/home_screen.dart';
import 'package:dog_app/views/login_screen/login_screen.dart';
import 'package:dog_app/views/nfc_Scan/bar_code_scan.dart';
import 'package:dog_app/views/profile_screen/profile_screen.dart';
import 'package:dog_app/views/sign_up_screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/color_constants.dart';
import '../../constants/image_constants.dart';
import '../../helper/common_widgets.dart';
import '../../provider/dashboard_provider.dart';
import '../../widgets/image_view.dart';
import '../base_view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    NfcScan(),
   ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardProvider>(
      onModelReady: (provider) {
      //  provider.onItemTapped(0);
      },
      builder: (context, provider, _) {
        return Scaffold(

          body: Center(
            child: _widgetOptions.elementAt(provider.selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageView(
                  path: ImagesConstants.homeIcon,
                  color: ColorConstants.lightGrayColor,
                  height: DimensionConstants.d22.h,
                  width: DimensionConstants.d20.w,
                ),
                activeIcon: ImageView(
                  path: ImagesConstants.homeIcon,
                  color: ColorConstants.primaryColor,
                  height: DimensionConstants.d22.h,
                  width: DimensionConstants.d20.w,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: ImageView(
                    path: ImagesConstants.scanIcon,
                    color: ColorConstants.lightGrayColor,
                    height: DimensionConstants.d22.h,
                    width: DimensionConstants.d20.w,
                  ),
                  activeIcon: ImageView(
                    path: ImagesConstants.scanIcon,
                    color: ColorConstants.primaryColor,
                    height: DimensionConstants.d22.h,
                    width: DimensionConstants.d20.w,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageView(
                    path: ImagesConstants.profileIcon,
                    color: ColorConstants.lightGrayColor,
                    height: DimensionConstants.d22.h,
                    width: DimensionConstants.d20.w,
                  ),
                  activeIcon: ImageView(
                    path: ImagesConstants.profileIcon,
                    color: ColorConstants.primaryColor,
                    height: DimensionConstants.d22.h,
                    width: DimensionConstants.d20.w,
                  ),
                  label: '')
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorConstants.whiteColor,
            currentIndex: provider.selectedIndex,
            onTap: provider.onItemTapped,
            elevation: 5,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        );
      },
    );
  }
}
