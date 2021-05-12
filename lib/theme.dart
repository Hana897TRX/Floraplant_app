import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = Color(0xFFFFFFFF);
  static const Color green = Color(0XFF1A9025);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color pink = Color(0xFFFFACED);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, green],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
