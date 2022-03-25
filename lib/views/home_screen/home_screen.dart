import 'package:dog_app/constants/api_constants.dart';
import 'package:dog_app/constants/image_constants.dart';
import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/provider/home_provider.dart';
import 'package:dog_app/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

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
    return BaseView<HomeScreenProvider>(onModelReady: (provider) {
      provider.getHomeDetail(context);
    }, builder: (context, provider, _) {
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
          body: provider.state == ViewState.Busy || provider.details == null
              ?  Container(height: double.maxFinite,
                width: double.maxFinite,
                child: Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            ColorConstants.primaryColor)),
                  ),
              )
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: DimensionConstants.d200.h,
                              width: DimensionConstants.d414.w,
                              color: ColorConstants.imageBackgroundColor,
                              child: ImageView(
                                path:ApiConstant.BASE_URL +
                                    provider.details!.data!.bannerImage,

                                fit: BoxFit.cover,
                              ),
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
                                  radius: DimensionConstants.d70.r,
                                  backgroundColor: ColorConstants.whiteColor,
                                  child: ClipRRect(
                                   //clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(DimensionConstants.d70.r),
                                    child: ImageView(
                                      path: ApiConstant.BASE_URL +
                                          provider.details!.data!.image,
                                      width: double.maxFinite,
                                      height: double.maxFinite,
                                      fit: BoxFit.cover,
                                     // radius:DimensionConstants.d70.r ,

                                    ),
                                  ),
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
                                borderRadius: BorderRadius.circular(
                                    DimensionConstants.d20),
                              ),
                              child: Container(
                                width: DimensionConstants.d293,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [ Text(provider.details!.data!.dogName)
                                      .boldText(
                                      ColorConstants.blackColor,
                                      DimensionConstants.d30.sp,
                                      TextAlign.center),
                                    Text(" (Name)").lightText(
                                        ColorConstants.blackColor,
                                        DimensionConstants.d18.sp,
                                        TextAlign.end),
                                  ],),


                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [  Text(provider.details!.data!.dogBreed)
                                          .lightText(
                                          ColorConstants.lightGrayColor,
                                          DimensionConstants.d20.sp,
                                          TextAlign.center
                                          ),
                                        Text(" (Breed)").lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.end),
                                      ],),
                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                       children: <Widget>[

                                       Text(provider.datetime.toString() +
                                           "years".tr())
                                           .lightText(
                                           ColorConstants.lightGrayColor,
                                           DimensionConstants.d18.sp,
                                           TextAlign.center),
                                         SizedBox(width: DimensionConstants.d20.w,),

                                         Container(
                                           color:
                                               ColorConstants.lightGrayColor,
                                           height: DimensionConstants.d19.h,
                                           width: DimensionConstants.d1.w,
                                         ),
                                         SizedBox(width: DimensionConstants.d20.w,),

                                       Text(provider.details!.data!.dogSex)
                                           .lightText(
                                           ColorConstants.lightGrayColor,
                                           DimensionConstants.d18.sp,
                                           TextAlign.center)
                                       ],
                                     ),
                                    SizedBox(height: DimensionConstants.d10.h,),  ],
                                ),
                              )),
                        ),
                        SizedBox(height: DimensionConstants.d20.h),
                        Text("dogChipNO".tr()).regularText(
                            ColorConstants.textGrayColor,
                            DimensionConstants.d20.sp,
                            TextAlign.center),
                        SizedBox(height: DimensionConstants.d7.h),
                        Text(provider.details!.data!.veterinaryNumber).boldText(
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
                              width: DimensionConstants.d354.w,
                              decoration: BoxDecoration(
                                color: ColorConstants.whiteColor,
                                borderRadius: BorderRadius.circular(
                                    DimensionConstants.d20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: DimensionConstants.d20.w),
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),
                                    Padding
                                    (padding: EdgeInsets.only(left: DimensionConstants.d80.w,
                                        right: DimensionConstants.d80.w),
                                      child: Text("owner_details".tr()).boldText(
                                        ColorConstants.blackColor,
                                        DimensionConstants.d20.sp,
                                        TextAlign.center),),
                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),
                                    Row(
                                      children: [ Text("  Name :").boldText(
                                          ColorConstants.lightGrayColor,
                                          DimensionConstants.d18.sp,
                                          TextAlign.end),
                                        SizedBox(width: DimensionConstants.d5.w,),
                                        Text(provider
                                          .details!.data!.ownerName)
                                          .lightText(
                                          ColorConstants.lightGrayColor,
                                          DimensionConstants.d18.sp,
                                          TextAlign.left,
                                          maxLines: 1,
                                        ),
                                      ],),
                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),
                                    Row(
                                      children: [ Text("Phone Number :  ").boldText(
                                          ColorConstants.lightGrayColor,
                                          DimensionConstants.d18.sp,
                                          TextAlign.end),
                                        SizedBox(width: DimensionConstants.d5.w,),
                                        Text(provider
                                            .details!.data!.contactPhone)
                                            .lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.left,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),

                                      ],),
                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),
                                    Row(

                                      children: [ Text("Mail :  ").boldText(
                                          ColorConstants.lightGrayColor,
                                          DimensionConstants.d18.sp,
                                          TextAlign.end),
                                        SizedBox(width: DimensionConstants.d5.w,),
                                        Text(provider
                                            .details!.data!.email)
                                            .lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.left,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),

                                      ],),

                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),
                                    Row(

                                      children: [ Text("Whatsapp :  ").boldText(
                                          ColorConstants.lightGrayColor,
                                          DimensionConstants.d18.sp,
                                          TextAlign.end),
                                        SizedBox(width: DimensionConstants.d5.w,),
                                        Text(provider
                                            .details!.data!.whatsapp)
                                            .lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.left,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),

                                      ],),
                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [ Text("Address :  ").boldText(
                                          ColorConstants.lightGrayColor,
                                          DimensionConstants.d18.sp,
                                          TextAlign.end),
                                        SizedBox(width: DimensionConstants.d5.w,),
                                      Expanded
                                        (child:  Text(provider
                                            .details!.data!.address)
                                            .lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.left,
                                            maxLines: 2,
                                            overflow:
                                            TextOverflow.ellipsis),)

                                      ],),
                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),
                                  ],
                                ),
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
