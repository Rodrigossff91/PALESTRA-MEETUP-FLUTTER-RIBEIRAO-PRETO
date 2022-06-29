import 'package:flutter/material.dart';

titleStyle(
    {Color? color, FontWeight? fontWeight, double? size, double? height}) {
  return TextStyle(
      height: height ?? 1,
      fontFamily: "Poppins",
      color: color ?? Colors.black,
      fontSize: size ?? 21,
      fontWeight: fontWeight ?? FontWeight.bold);
}
