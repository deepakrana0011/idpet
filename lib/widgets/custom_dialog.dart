import 'package:dog_app/constants/dimension_constants.dart';
import 'package:dog_app/extensions/allextensions.dart';
import 'package:dog_app/widgets/round_corner_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback galleryClick;
  final VoidCallback cameraClick;
  final VoidCallback cancelClick;

  CustomDialog(
      {required this.galleryClick,
      required this.cameraClick,
      required this.cancelClick});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: RoundCornerShape(
        bgColor: Colors.white,
        radius: DimensionConstants.d20.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Ink(
              decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                    10,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.center,
                    child: const Text(
                      "Choose from",
                    ).mediumText(
                        ColorConstants.whiteColor, 20.sp, TextAlign.center)),
              ),
            ),
            GestureDetector(
              onTap: galleryClick,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Phone gallery",
                  style: TextStyle(
                      color: ColorConstants.primaryColor, fontSize: 20.sp),
                ),
              ),
            ),
            const Divider(
              height: 1.0,
              color: Colors.black,
            ),
            GestureDetector(
              onTap: cameraClick,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Camera",
                  style: TextStyle(
                      color: ColorConstants.primaryColor, fontSize: 20.sp),
                ),
              ),
            ),
            const Divider(
              height: 1.0,
              color: Colors.black,
            ),
            GestureDetector(
              onTap: cancelClick,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: ColorConstants.primaryColor, fontSize: 20.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
