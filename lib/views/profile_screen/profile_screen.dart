
import 'package:dog_app/constants/api_constants.dart';
import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/enum/viewstate.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/helper/dialogue_helper.dart';
import 'package:dog_app/helper/keyboard_helper.dart';
import 'package:dog_app/helper/shared_pref.dart';
import 'package:dog_app/provider/home_provider.dart';
import 'package:dog_app/provider/profile_provider.dart';
import 'package:dog_app/views/base_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../constants/decoration.dart';
import '../../constants/dimension_constants.dart';
import '../../constants/image_constants.dart';
import '../../widgets/custom_shape.dart';
import '../../widgets/image_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileScreenProvider>(onModelReady: (provider) {
      provider.getProfileDetail(context);
    }, builder: (context, provider, _) {return Scaffold(
            backgroundColor: ColorConstants.whiteColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Text("profile".tr()).boldText(ColorConstants.whiteColor,
                  DimensionConstants.d25.sp, TextAlign.center),
              backgroundColor: ColorConstants.primaryColor,
              actions: [
                GestureDetector(
                    onTap: () {provider.details== null ? DialogHelper.showMessage(context, "no_Internet_Connection".tr())
                      : Navigator.pushNamed(context, RoutesConstants.editProfile, arguments: provider.details!.data);
                    },
                    child: Padding(
                        padding: EdgeInsets.only(
                            bottom: DimensionConstants.d5.h,
                            right: DimensionConstants.d21.w),
                        child: const ImageView(
                          path: ImagesConstants.edit,
                        ))),
                GestureDetector(
                  onTap: () {
                    DialogHelper.showDialogWithTwoButtons(context, 'signout'.tr(), 'yes'.tr(), 'cancel'.tr(), 'are_you_sure_you_want_signout'.tr(),
                        positiveButtonPress: (){
                          _signOut(context);
                        }, negativeButtonPress: () {
                          Navigator.pop(context);
                        });
                  },
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: DimensionConstants.d5.h,
                          right: DimensionConstants.d25.w),
                      child: const ImageView(
                        path: ImagesConstants.logOut,
                      )),
                )
              ],
            ),
            body: provider.state == ViewState.Busy || provider.details == null
                ? const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      ColorConstants.primaryColor)),
            )
                :  SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: DimensionConstants.d20.w),
                      child: Column(
                        children: [


                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),

                          SizedBox(
                            height: DimensionConstants.d60.h,
                            child: TextFormField(
                              readOnly: true,
                              decoration: ViewDecoration.inputDecorationWithCurve(
                                provider.details!.data!.ownerName,
                                Colors.transparent,
                                radius: DimensionConstants.d15.r,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          SizedBox(
                            height: DimensionConstants.d60.h,
                            child: TextFormField(
                              readOnly: true,
                              decoration: ViewDecoration.inputDecorationWithCurve(
                             provider.details!.data!.ownerSurname,

                                Colors.transparent,
                                radius: DimensionConstants.d15.r,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          SizedBox(
                            height: DimensionConstants.d60.h,
                            child: TextFormField(
                              readOnly: true,
                              decoration: ViewDecoration.inputDecorationWithCurve(
                                provider.details!.data!.address,

                                Colors.transparent,
                                radius: DimensionConstants.d15.r,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          SizedBox(
                            height: DimensionConstants.d60.h,
                            child: TextFormField(
                              readOnly: true,
                              decoration: ViewDecoration.inputDecorationWithCurve(
                              provider.details!.data!.contactPhone,
                                Colors.transparent,
                                radius: DimensionConstants.d15.r,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          SizedBox(
                            height: DimensionConstants.d60.h,
                            child: TextFormField(
                              readOnly: true,
                              decoration: ViewDecoration.inputDecorationWithCurve(
                             provider.details!.data!.whatsapp,
                               Colors.transparent,
                                radius: DimensionConstants.d15.r,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          SizedBox(
                            height: DimensionConstants.d60.h,
                            child: TextFormField(
                              readOnly: true,
                              decoration: ViewDecoration.inputDecorationWithCurve(
                               provider.details!.data!.email,
                                Colors.transparent,
                                radius: DimensionConstants.d15.r,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d50.h,
                    )
                  ],
                ),
              ),
            ));
      }
    );

  }
  Future<void> _signOut(BuildContext context) async {
    SharedPref.clearSharedpref();
    KeyboardHelper.hideKeyboard(context);
    Navigator.pushNamedAndRemoveUntil(context,RoutesConstants.logInScreen, (Route<dynamic> route) => false);
    DialogHelper.showMessage(
        context, 'Signout successfully');
  }
}
