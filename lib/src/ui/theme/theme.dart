import 'package:flutter/material.dart';
import 'package:calculator/src/ui/global/app_colors.dart';

String appName = 'App Name';

ButtonStyle buttonOrangeStyle = ButtonStyle(
  shape:
  MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  )),
  foregroundColor: MaterialStateProperty.all(Colors.white),
  backgroundColor: MaterialStateProperty.all(mediumPurpleColor),
  textStyle: MaterialStateProperty.all(
    const TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      color: Colors.white,
    ),
  ),
);

ButtonStyle buttonGreyStyle = ButtonStyle(
  shape:
  MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  )),
  foregroundColor: MaterialStateProperty.all(Colors.black),
  backgroundColor: MaterialStateProperty.all(wildStrawberryColor),
  textStyle: MaterialStateProperty.all(
    const TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      color: Colors.black,
    ),
  ),
);

ButtonStyle buttonDarkGreyStyle = ButtonStyle(
  shape:
  MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  )),
  foregroundColor: MaterialStateProperty.all(Colors.white),
  backgroundColor: MaterialStateProperty.all(coralColor),
  textStyle: MaterialStateProperty.all(
    const TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      color: Colors.white,
    ),
  ),
);

ButtonStyle buttonBlackStyle = ButtonStyle(
  shape:
  MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  )),
  foregroundColor: MaterialStateProperty.all(Colors.white),
  backgroundColor: MaterialStateProperty.all(textColorBlack),
  textStyle: MaterialStateProperty.all(
    const TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      color: Colors.white,
    ),
  ),
);