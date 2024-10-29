import 'package:flutter/material.dart';

enum ColorType {
  primary,
  primaryDark,
  primaryLight
}

class ColorUtils {
  static Color getColor(ColorType type, BuildContext context) {
    switch (type) {
      case ColorType.primary:
        return Theme.of(context).primaryColor;
      case ColorType.primaryDark:
        return Theme.of(context).primaryColorDark;
      case ColorType.primaryLight:
        return Theme.of(context).primaryColorLight;
      default:
        return Colors.grey;
    }
  } 
}