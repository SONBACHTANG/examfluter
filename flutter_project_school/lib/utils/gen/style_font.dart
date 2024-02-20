import 'package:flutter/material.dart';

import 'colors.gen.dart';

class StyleFont {
  static const double _fontSizeScale = 0;
  static const double _fontSizeDefault= 16;

  static TextStyle bold([double fontSize = _fontSizeDefault]) {
    fontSize += _fontSizeScale;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: ColorName.text,
    );
  }

  static TextStyle medium([double fontSize = _fontSizeDefault]) {
    fontSize += _fontSizeScale;
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: ColorName.text,
    );
  }

  static TextStyle regular([double fontSize = _fontSizeDefault]) {
    fontSize += _fontSizeScale;
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: ColorName.text,
    );
  }
}
