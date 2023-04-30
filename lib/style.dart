import 'package:flutter/painting.dart';

class TextStyles {
  static const headline4 = TextStyle(
    color: ColorStyles.black,
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static const headline5 = TextStyle(
    color: ColorStyles.black,
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  static const headline6 = TextStyle(
    color: ColorStyles.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );
  static const subtitle1 = TextStyle(
    color: ColorStyles.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );
  static const subtitle2 = TextStyle(
    color: ColorStyles.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );
  static const body1 = TextStyle(
    color: ColorStyles.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  static const body2 = TextStyle(
    color: ColorStyles.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static const button = TextStyle(
    color: ColorStyles.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  );
  static const caption = TextStyle(
    color: ColorStyles.black,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  static const appBar = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ColorStyles.black,
  );
  static const bigButton = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const smallButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const textField = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: ColorStyles.black,
  );
  static const textLabel = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: ColorStyles.grey,
  );
}

class ColorStyles {
  static const blue = Color(0xff002edf);
  static const lightBlue = Color(0xff6782ec);
  static const paleBlue = Color(0xffe6ebfe);
  static const orange = Color(0xffff7034);
  static const green = Color(0xff56b276);
  static const black = Color(0xff1e1e1e);
  static const grey = Color(0xff7a7e80);
  static const lightGrey = Color(0xffdadada);
  static const paleGrey = Color(0xfff6f7fa);
  static const white = Color(0xffffffff);
}
