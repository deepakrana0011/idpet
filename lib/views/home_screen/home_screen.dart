import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/provider/home_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../constants/color_constants.dart';
import '../../constants/dimension_constants.dart';
import '../base_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenProvider>(
        onModelReady: (provider) {},
        builder: (context, provider, _) {
          return Scaffold(
              backgroundColor: ColorConstants.backGround,
              appBar: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                elevation: 0,
                title: Text("home".tr()).boldText(ColorConstants.whiteColor,
                    DimensionConstants.d25.sp, TextAlign.center),
                backgroundColor: ColorConstants.primaryColor,
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: DimensionConstants.d200.h,
                            width: DimensionConstants.d414.w,
                            color: ColorConstants.imageBackgroundColor,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: DimensionConstants.d145.h,
                                left: DimensionConstants.d135.w,
                                right: DimensionConstants.d141.w),
                            child: Material(
                              elevation: DimensionConstants.d4,
                              shape: const CircleBorder(),
                              child: CircleAvatar(
                                radius: DimensionConstants.d70.sp,
                                backgroundColor: ColorConstants.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: DimensionConstants.d20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: DimensionConstants.d64.w,
                            right: DimensionConstants.d57.w),
                        child: Card(
                            elevation: DimensionConstants.d2,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(DimensionConstants.d20),
                            ),
                            child: Container(
                              height: DimensionConstants.d107.h,
                              width: DimensionConstants.d293,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: DimensionConstants.d10.h,
                                  ),
                                  const Text("Charlie").boldText(
                                      ColorConstants.blackColor,
                                      DimensionConstants.d30.sp,
                                      TextAlign.center),
                                  SizedBox(
                                    height: DimensionConstants.d9.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: DimensionConstants.d27.w),
                                    child: Row(
                                      children: <Widget>[
                                        const Text("Bread").lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.center),
                                        SizedBox(
                                            width: DimensionConstants.d12.w),
                                        Container(
                                          color: ColorConstants.lightGrayColor,
                                          height: DimensionConstants.d19.h,
                                          width: DimensionConstants.d1.w,
                                        ),
                                        SizedBox(
                                            width: DimensionConstants.d16.w),
                                        const Text("2 Years old").lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.center),
                                        SizedBox(
                                            width: DimensionConstants.d11.w),
                                        Container(
                                          color: ColorConstants.lightGrayColor,
                                          height: DimensionConstants.d19.h,
                                          width: DimensionConstants.d1.w,
                                        ),
                                        SizedBox(
                                            width: DimensionConstants.d11.w),
                                        const Text("Male").lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.center),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                      SizedBox(height: DimensionConstants.d20.h),
                      const Text("Dog Chip No").regularText(
                          ColorConstants.textGrayColor,
                          DimensionConstants.d20.sp,
                          TextAlign.center),
                      SizedBox(height: DimensionConstants.d7.h),
                      const Text("dsdf12365").boldText(
                          ColorConstants.blackColor,
                          DimensionConstants.d30.sp,
                          TextAlign.center),
                      SizedBox(height: DimensionConstants.d20.h),
                      Padding(
                        padding: EdgeInsets.only(
                            left: DimensionConstants.d30.w,
                            right: DimensionConstants.d30.w),
                        child: Card(
                          elevation: DimensionConstants.d4,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(DimensionConstants.d20),
                          ),
                          child: Container(
                            height: DimensionConstants.d200.h,
                            width: DimensionConstants.d354.w,
                            decoration: BoxDecoration(
                              color: ColorConstants.whiteColor,
                              borderRadius:
                                  BorderRadius.circular(DimensionConstants.d20),
                            ),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: DimensionConstants.d13.h,
                                ),
                                const Text("Owner Details").boldText(
                                    ColorConstants.blackColor,
                                    DimensionConstants.d20.sp,
                                    TextAlign.center),
                                SizedBox(
                                  height: DimensionConstants.d27.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: DimensionConstants.d16.w),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        height: DimensionConstants.d23.h,
                                        width: DimensionConstants.d110.w,
                                        child: const Text("Owner Name")
                                            .lightText(
                                                ColorConstants.lightGrayColor,
                                                DimensionConstants.d18.sp,
                                                TextAlign.left,
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                      SizedBox(
                                        width: DimensionConstants.d64.w,
                                      ),
                                      Container(
                                        height: DimensionConstants.d23.h,
                                        width: DimensionConstants.d140.w,
                                        child: const Text("Phone Number")
                                            .lightText(
                                                ColorConstants.lightGrayColor,
                                                DimensionConstants.d18.sp,
                                                TextAlign.left,
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: DimensionConstants.d22.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: DimensionConstants.d16.w),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        height: DimensionConstants.d23.h,
                                        width: DimensionConstants.d135.w,
                                        child: const Text("mail@gmail.com")
                                            .lightText(
                                                ColorConstants.lightGrayColor,
                                                DimensionConstants.d18.sp,
                                                TextAlign.left,
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                      SizedBox(
                                        width: DimensionConstants.d37.w,
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d23.h,
                                        width: DimensionConstants.d156.w,
                                        child: const Text("WhatsApp Number")
                                            .lightText(
                                                ColorConstants.lightGrayColor,
                                                DimensionConstants.d17.sp,
                                                TextAlign.left,
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: DimensionConstants.d26.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: DimensionConstants.d16.w),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        height: DimensionConstants.d23.h,
                                        width: DimensionConstants.d135.w,
                                        child: const Text("Owner Address")
                                            .lightText(
                                                ColorConstants.lightGrayColor,
                                                DimensionConstants.d18.sp,
                                                TextAlign.left,
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                      SizedBox(
                                        width: DimensionConstants.d37.w,
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d23.h,
                                        width: DimensionConstants.d156.w,
                                        child: const Text("").lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d17.sp,
                                            TextAlign.left,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d30.h,
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
