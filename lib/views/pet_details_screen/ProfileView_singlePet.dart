import 'package:dog_app/constants/api_constants.dart';
import 'package:dog_app/constants/image_constants.dart';
import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/provider/get_singlePet_provider.dart';
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

// ignore: must_be_immutable
class SinglePetDetails extends StatefulWidget {
  SinglePetDetails({Key? key, required this.petId}) : super(key: key);
  String petId;

  @override
  State<SinglePetDetails> createState() => _SinglePetDetailsState();
}

class _SinglePetDetailsState extends State<SinglePetDetails> {
  @override
  Widget build(BuildContext context) {
    return BaseView<GetSinglePetProvider>(onModelReady: (provider) {
      provider.getSinglePetDetail(context, widget.petId);
    }, builder: (context, provider, _) {
      return Scaffold(
          backgroundColor: ColorConstants.backGround,
          appBar:  AppBar(
            leadingWidth:  DimensionConstants.d45.w,
            leading:Padding(
              padding: EdgeInsets.only(left: DimensionConstants.d20.w),
              child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: ImageView(
                  path:ImagesConstants.backArrow,

                ),
              ),
            ),

            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text("petDetails".tr()).boldText(ColorConstants.whiteColor,
                DimensionConstants.d25.sp, TextAlign.center),
            backgroundColor: ColorConstants.primaryColor,
            actions: [
              GestureDetector(
                  onTap: () {provider.Details== null ? DialogHelper.showMessage(context, "no_Internet_Connection".tr())
                      : Navigator.pushNamed(context, RoutesConstants.editPetProfileScreen, arguments: provider.Details);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: DimensionConstants.d5.h,
                          right: DimensionConstants.d21.w),
                      child: const ImageView(
                        path: ImagesConstants.edit,
                      ))),
            ],
          ),
          body: provider.state ==
                  ViewState.Busy || provider.Details == null
              ? Container(
                  height: double.maxFinite,
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
                                path: ApiConstant.BASE_URL +
                                    provider.Details!.bannerImage,
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
                                    borderRadius: BorderRadius.circular(
                                        DimensionConstants.d70.r),
                                    child: ImageView(
                                      path: ApiConstant.BASE_URL +
                                          provider.Details!.image,
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
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: DimensionConstants.d20.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(provider.Details!.petName)
                                              .boldText(
                                                  ColorConstants.blackColor,
                                                  DimensionConstants.d30.sp,
                                                  TextAlign.center
                                          ,maxLines: 2),
                                          Text("(")
                                              .lightText(
                                              ColorConstants.blackColor,
                                              DimensionConstants.d18.sp,
                                              TextAlign.center),
                                          Text("name".tr()).lightText(
                                              ColorConstants.blackColor,
                                              DimensionConstants.d18.sp,
                                              TextAlign.center),
                                          Text(")")
                                              .lightText(
                                              ColorConstants.blackColor,
                                              DimensionConstants.d18.sp,
                                              TextAlign.center),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(provider.Details!.petBreed)
                                            .lightText(
                                                ColorConstants.lightGrayColor,
                                                DimensionConstants.d20.sp,
                                                TextAlign.center),
                                        Text(" (")
                                            .lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.center),
                                        Text("breed".tr()).lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.end),
                                        Text(")")
                                            .lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.center),
                                      ],
                                    ),
                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                    Text("(")
                                  .lightText(
                                  ColorConstants.lightGrayColor,
                                  DimensionConstants.d18.sp,
                                  TextAlign.center),
                                        if(provider.datetime>=356)(
                                          Text((provider.datetime ~/356).toString() +" "+
                                              "years".tr())
                                              .lightText(
                                              ColorConstants.lightGrayColor,
                                              DimensionConstants.d18.sp,
                                              TextAlign.center))
                                        else if(provider.datetime>=30)(
                                            Text((provider.datetime ~/30).toString()+" "+
                                                "months".tr())
                                                .lightText(
                                                ColorConstants.lightGrayColor,
                                                DimensionConstants.d18.sp,
                                                TextAlign.center))
                                        else if(provider.datetime<30)(
                                            Text(provider.datetime.toString() +" "+
                                                "days".tr())
                                                .lightText(
                                                ColorConstants.lightGrayColor,
                                                DimensionConstants.d18.sp,
                                                TextAlign.center)),
                                        Text(")")
                                            .lightText(
                                            ColorConstants.lightGrayColor,
                                            DimensionConstants.d18.sp,
                                            TextAlign.center),
                                        SizedBox(
                                          width: DimensionConstants.d10.w,
                                        ),
                                        Container(
                                          color: ColorConstants.lightGrayColor,
                                          height: DimensionConstants.d19.h,
                                          width: DimensionConstants.d1.w,
                                        ),
                                        SizedBox(
                                          width: DimensionConstants.d10.w,
                                        ),
                                        Text(provider.Details!.petSex)
                                            .lightText(
                                                ColorConstants.lightGrayColor,
                                                DimensionConstants.d18.sp,
                                                TextAlign.center)
                                      ],
                                    ),
                                    SizedBox(
                                      height: DimensionConstants.d10.h,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(height: DimensionConstants.d20.h),
                        Text("dogChipNO".tr()).regularText(
                            ColorConstants.textGrayColor,
                            DimensionConstants.d20.sp,
                            TextAlign.center),
                        SizedBox(height: DimensionConstants.d7.h),
                        Text(provider.Details!.veterinaryNumber).boldText(
                            ColorConstants.blackColor,
                            DimensionConstants.d30.sp,
                            TextAlign.center),
                        SizedBox(
                          height: DimensionConstants.d30.h,
                        ),
                        Card(
                          elevation: DimensionConstants.d4,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(DimensionConstants.d20),
                          ),
                          child: Container(
                            width: DimensionConstants.d354.w,
                            decoration: BoxDecoration(
                              color: ColorConstants.whiteColor,
                              borderRadius:
                                  BorderRadius.circular(DimensionConstants.d20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: DimensionConstants.d20.h,
                                ),
                                Padding(padding:EdgeInsets.symmetric(horizontal: DimensionConstants.d20.w)
                                ,child: Text("Note_and_info".tr()).boldText(
                                        ColorConstants.blackColor,
                                        DimensionConstants.d22.sp,
                                        TextAlign.center),),
                                SizedBox(
                                  height: DimensionConstants.d20.h,
                                ),
                                Padding(padding:EdgeInsets.symmetric(horizontal: DimensionConstants.d20.w),
                               child: Text(provider.Details!.description)
                                    .regularText(
                                        ColorConstants.lightGrayColor,
                                        DimensionConstants.d17.sp,
                                        TextAlign.start),),
                                SizedBox(
                                  height: DimensionConstants.d20.h,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
    });
  }
}
