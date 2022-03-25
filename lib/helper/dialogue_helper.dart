
import 'package:another_flushbar/flushbar.dart';
import 'package:dog_app/constants/color_constants.dart';
import 'package:dog_app/constants/dimension_constants.dart';
import 'package:dog_app/constants/image_constants.dart';
import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/widgets/image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class DialogHelper{
  static showMessage(BuildContext context, String message) {
    Flushbar(
      message: message,
      backgroundColor: ColorConstants.primaryColor,
      duration: const Duration(seconds: 3),
    ).show(context);
  }



  static Future showDialogWithTwoButtons(
      BuildContext context,
      String title,
      String positiveButtonText,
      String negativeButtonText,
      String content, {
        required VoidCallback positiveButtonPress,
        required VoidCallback negativeButtonPress,
        barrierDismissible = true,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text(negativeButtonText).mediumText(
                     ColorConstants.primaryColor, DimensionConstants.d18.sp, TextAlign.center),
              onPressed: () {
                if (negativeButtonPress != null) {
                  negativeButtonPress();
                } else {
                  Navigator.of(context, rootNavigator: true).pop();
                }
              },
            ),
            TextButton(
              child: Text(positiveButtonText).mediumText(
               ColorConstants.primaryColor, DimensionConstants.d18.sp, TextAlign.center),
              onPressed: () {
                if (positiveButtonPress != null) {
                  Navigator.of(context, rootNavigator: true).pop();
                  positiveButtonPress();
                } else {
                  Navigator.of(context, rootNavigator: true).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }





/*   static Future showDialogWithTwoButtonswithImage(
      BuildContext context,
      String title,
      String positiveButtonText,
      String negativeButtonText,
      String image,
      TextEditingController link,
      {
        required VoidCallback positiveButtonPress,
        VoidCallback? negativeButtonPress,
        barrierDismissible = true,
      }) {
    return showDialog(

        context: context,
        builder: (context) {
          return AlertDialog(

            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,

              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.r),
                          topLeft: Radius.circular(20.r)),
                      color: Colors.white,
                    ),
                    child: Center(
                        child:  Image.asset(ConstImg.app_logo,height: 70.h,)),
                  ),
                  SizedBox(
                      height: 10.h
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageView(path:
                      image
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                    child: TextFormField(
                      cursorColor: colorConstats.colorR,

                      validator: (value){
                        if (value!.trim().isEmpty) {
                          return 'Empty field';
                        }

                      },
                      controller: link,

                      style: TextStyle(fontFamily:  "popins",


                          color:Color(0XFF4F4F4F),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,

                      decoration: InputDecoration(

                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorConstats.colorR),
                        ),

                        hintText:  title=='Whatsapp'|| title=='Phone'? 'Enter ' +title +' number':
                        'Enter '+   title +' id',
                        hintStyle: TextStyle(fontFamily:  "popins",
                            color: colorConstats.colorHtextGry,
                            fontSize:16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),


                ],
              ),
            ),
            //shape: border,
            actions: <Widget>[
              TextButton(
                child: Text(negativeButtonText,style:decoration.ltextstyle(FontWeight.w500, 20.sp, colorConstats.colorR),),*//*.mediumText(
                     colorConstats.colorR, 18, TextAlign.center),*//*
                onPressed: () {
                  if (negativeButtonPress != null) {
                    negativeButtonPress();
                  } else {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                },
              ),
              TextButton(
                  child: Text(positiveButtonText,style: decoration.ltextstyle(FontWeight.w500, 20.sp, colorConstats.colorR),),*//*.mediumText(
                     colorConstats.colorR, 18, TextAlign.center),*//*
                  onPressed: positiveButtonPress
                //   () {
                // if (positiveButtonPress != null) {
                //   positiveButtonPress();
                // } else {
                //   Navigator.of(context, rootNavigator: true).pop();
                // }
                //  },
              )
            ],
          );
        });
  }*/
}

