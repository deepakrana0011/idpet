
import 'package:dog_app/constants/api_constants.dart';
import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/constants/dimension_constants.dart';
import 'package:dog_app/constants/image_constants.dart';
import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/helper/date_functions.dart';
import 'package:dog_app/provider/get_pet_provider.dart';
import 'package:dog_app/provider/home_provider.dart';
import 'package:dog_app/views/base_view.dart';
import 'package:dog_app/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewPetScreen extends StatefulWidget {
  const HomeViewPetScreen({Key? key}) : super(key: key);

  @override
  State<HomeViewPetScreen> createState() => _HomeViewPetScreenState();
}

class _HomeViewPetScreenState extends State<HomeViewPetScreen> {
  var datetime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text("home".tr()).boldText(ColorConstants.whiteColor,
              DimensionConstants.d25.sp, TextAlign.center),
          backgroundColor: ColorConstants.primaryColor,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RoutesConstants.addPetInfo);
              },
              child:  Padding(padding: EdgeInsets.only(right: DimensionConstants.d20.w),
                child: ImageView(
                  path: ImagesConstants.addPet,

                ),
              ),
            )
          ],
        ),
        body:

        BaseView<GetPetHomeProvider>(onModelReady: (provider) {
          provider.getPetDetail(context);
        }, builder: (context, provider, _) {
          return provider.state ==
              ViewState.Busy
              ? Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      ColorConstants.primaryColor)),
            ),
          ) : provider.data.length == 0 ?
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(RoutesConstants.addPetInfo);
                  },
                  child: ImageView(
                    path: ImagesConstants.logo,
                    height: DimensionConstants.d76.h,
                    width: DimensionConstants.d76.w,
                  ),
                ),
                SizedBox(height: DimensionConstants.d11.h,),
                Text("noPetAdded".tr()).mediumText(
                    ColorConstants.blackColor, DimensionConstants.d18.sp,
                    TextAlign.center),
              ],
            ),
          )
              : ListView.builder(itemCount: provider.data.length,
              itemBuilder: (context, position) {
                return Padding(
                  padding: EdgeInsets.only(top: DimensionConstants.d10.h,
                  left: DimensionConstants.d10.w,right: DimensionConstants.d10.w),
                  child: GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, RoutesConstants.singlePetDetailsScreen, arguments:provider.data[position].id );
                    },
                    child: Card(elevation: DimensionConstants.d4,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DimensionConstants.d10.r)
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(//height: DimensionConstants.d106.h,
                        width: DimensionConstants.d374.w,
                       // color: ColorConstants.lightGrayTextFiled,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: DimensionConstants.d10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [SizedBox(
                              width: DimensionConstants.d20.w,
                            ),
                              Material(elevation: DimensionConstants.d5,
                                  borderRadius: BorderRadius.circular(
                                      DimensionConstants.d10.r),
                                  child: ClipRRect( borderRadius: BorderRadius.circular(DimensionConstants.d10.r),
                                    child: ImageView(
                                      path: ApiConstant.BASE_URL+provider.data[position].image,
                                      height: DimensionConstants.d83.h,
                                      width: DimensionConstants.d83.w,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                              ),
                              SizedBox(
                                width: DimensionConstants.d20.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Text(provider.data[position].petName)
                                        .boldText(ColorConstants.blackColor,
                                        DimensionConstants.d20.sp, TextAlign.start,
                                        maxLines: 2),
                                    SizedBox(height: DimensionConstants.d3.h,),
                                /*  Text(
                                        provider.data[position].petBreed +" ("+

                                            getDateDiffInYears(provider.data[position].petBirthDate).toString()+" Years)").regularText(
                                        ColorConstants.lightGrayColor,
                                        DimensionConstants.d18.sp, TextAlign.center,
                                    maxLines: 2),*/
                                    Text( provider.data[position].petBreed).regularText(
                                      ColorConstants.lightGrayColor,
                                      DimensionConstants.d18.sp, TextAlign.center,
                                      maxLines: 2),
                                    SizedBox(height: DimensionConstants.d3.h,),
                                     if(getDateDiffInYears(provider.data[position].petBirthDate)>=356)(
                                         Text("("+(getDateDiffInYears(provider.data[position].petBirthDate) ~/356).toString() +" "+
                                             "years".tr()+")")
                                             .lightText(
                                             ColorConstants.lightGrayColor,
                                             DimensionConstants.d18.sp,
                                             TextAlign.center,
                                             maxLines: 2))
                                     else if(getDateDiffInYears(provider.data[position].petBirthDate)>=30)(
                                         Text("("+(getDateDiffInYears(provider.data[position].petBirthDate)~/30).toString()+" "+
                                             "months".tr()+")")
                                             .lightText(
                                             ColorConstants.lightGrayColor,
                                             DimensionConstants.d18.sp,
                                             TextAlign.center,
                                             maxLines: 2))
                                     else if(getDateDiffInYears(provider.data[position].petBirthDate)<30)(
                                           Text("("+ getDateDiffInYears(provider.data[position].petBirthDate).toString() +" "+
                                               "days".tr()+")")
                                               .lightText(
                                               ColorConstants.lightGrayColor,
                                               DimensionConstants.d18.sp,
                                               TextAlign.center,
                                               maxLines: 2))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: DimensionConstants.d50.w,
                              ),
                              provider.state == ViewState.Busy
                                  ? Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: DimensionConstants.d20.h),
                                  child: const CircularProgressIndicator(
                                      valueColor:
                                      AlwaysStoppedAnimation<Color>(
                                          ColorConstants.primaryColor)),
                                ),
                              )
                                  :  GestureDetector(
                                onTap:(){
                                  Navigator.pushNamed(context, RoutesConstants.singlePetDetailsScreen, arguments:provider.data[position].id );
                                },
                                child: ImageView(
                                  path: ImagesConstants.fwdVector,
                                  height: DimensionConstants.d20.h,
                                ),
                              ),
                              SizedBox(
                                width: DimensionConstants.d40.w,
                              ),


                            ],

                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
          );
        }
        )
    );
  }
}

