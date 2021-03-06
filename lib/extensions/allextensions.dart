import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ExtendPedding on Widget {
  addAllSidePadding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

/*addPaddingHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.only(left: padding, right: padding),
      child: this,
    );
  }

  dynamicPaddingAllSide(double left, double right, double top, double bottom) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  addPaddingVertial(double padding) {
    return Padding(
      padding: EdgeInsets.only(top: padding, bottom: padding),
      child: this,
    );
  }

  addPaddingTop(double padding) {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(padding)),
      child: this,
    );
  }

  addPaddingBottom(double padding) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: this,
    );
  }*/
}

extension ExtendText on Text {
  regularText(Color color, double textSize, TextAlign center,
      {maxLines, overflow, textAlign}) {
    return Text(
      data!,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontFamily: "Mulish",
          fontWeight: FontWeight.w400,
          fontSize: textSize),
    );
  }

  mediumText(Color color, double textSize, TextAlign alignment,
      {maxLines, overflow}) {
    return Text(
      data!,
      maxLines: maxLines,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontFamily: "Mulish",
          fontWeight: FontWeight.w500,
          fontSize: textSize),
    );
  }

  boldText(Color color, double textSize, TextAlign alignment,
      {maxLines, overflow}) {
    return Text(
      data!,
      maxLines: maxLines,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontFamily: "Mulish",
          fontWeight: FontWeight.w700,
          fontSize: textSize),
    );
  }

  lightText(Color color, double textSize, TextAlign alignment,
      {maxLines, overflow}) {
    return Text(
      data!,
      maxLines: maxLines,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontFamily: "Mulish",
          fontWeight: FontWeight.w300,
          fontSize: textSize),
    );
  }

  semiBoldText(Color color, double textSize, TextAlign alignment,
      {maxLines, overflow}) {
    return Text(
      data!,
      maxLines: maxLines,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: textSize),
    );
  }

  semiMediumText(Color color, double textSize, TextAlign alignment,
      {maxLines, overflow}) {
    return Text(
      data!,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontFamily: "popins",
          fontWeight: FontWeight.w600,
          fontSize: textSize),
    );
  }
}

extension Decoration on Widget {
/*  Widget boxDecoration(
      {double topRight=0,
      double topLeft=0,
      double bottomRight=0,
      double bottomLeft=0,
      Color color}) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ScreenUtil().setHeight(topLeft)),
              topRight: Radius.circular(ScreenUtil().setHeight(topRight)),
              bottomLeft: Radius.circular(ScreenUtil().setHeight(bottomLeft)),
              bottomRight: Radius.circular(ScreenUtil().setHeight(bottomRight)))),
    );
  }*/
}
