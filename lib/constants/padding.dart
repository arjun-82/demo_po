import 'package:flutter/material.dart';

class SizePadding {
  static const double px4 = 4.0;
  static const double px8 = 8.0;
  static const double px16 = 16.0;
  static const double px32 = 32.0;
  static const double px64 = 64.0;

  // allPadding
  static EdgeInsets allPx4 = const EdgeInsets.all(px4);
  static EdgeInsets allPx8 = const EdgeInsets.all(px8);
  static EdgeInsets allPx16 = const EdgeInsets.all(px16);
  static EdgeInsets allPx32 = const EdgeInsets.all(px32);
  static EdgeInsets allPx64 = const EdgeInsets.all(px64);

  // horizontal padding
  static EdgeInsets horizontalPx4 = const EdgeInsets.symmetric(horizontal: px4);
  static EdgeInsets horizontalPx8 = const EdgeInsets.symmetric(horizontal: px8);
  static EdgeInsets horizontalPx16 =
      const EdgeInsets.symmetric(horizontal: px16);
  static EdgeInsets horizontalPx32 =
      const EdgeInsets.symmetric(horizontal: px32);
  static EdgeInsets horizontalPx64 =
      const EdgeInsets.symmetric(horizontal: px64);

  // vertical padding
  static EdgeInsets verticalPx4 = const EdgeInsets.symmetric(vertical: px4);
  static EdgeInsets verticalPx8 = const EdgeInsets.symmetric(vertical: px8);
  static EdgeInsets verticalPx16 = const EdgeInsets.symmetric(vertical: px16);
  static EdgeInsets verticalPx32 = const EdgeInsets.symmetric(vertical: px32);
  static EdgeInsets verticalPx64 = const EdgeInsets.symmetric(vertical: px64);
}
