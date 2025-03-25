import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class ButttonThemeUtil {
  // -------------------------- ElevatedButton --------------------------
  //? ------- Light -------
  static ElevatedButtonThemeData elevatedLight = ElevatedButtonThemeData(
      style: ButtonStyle(
          alignment: Alignment.center,
          animationDuration: const Duration(milliseconds: 100),
          backgroundColor:
              const WidgetStatePropertyAll(ColorPlattes.buttonColorLight),
          elevation: const WidgetStatePropertyAll(3),
          fixedSize: const WidgetStatePropertyAll(
            Size(160, 35),
          ),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          padding: WidgetStatePropertyAll(SizePadding.horizontalPx16),
          textStyle: WidgetStatePropertyAll(TextStyle(
              fontSize: TextSize.px16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontFamily: FontClass.raleway,
              color: ColorPlattes.textLightPrimary))));
  //? ------- Dark -------
  static ElevatedButtonThemeData elevatedDark = ElevatedButtonThemeData(
      style: ButtonStyle(
    alignment: Alignment.center,
    animationDuration: const Duration(milliseconds: 100),
    backgroundColor: const WidgetStatePropertyAll(ColorPlattes.buttonColorDark),
    elevation: const WidgetStatePropertyAll(3),
    fixedSize: const WidgetStatePropertyAll(
      Size(160, 35),
    ),
    shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    padding: WidgetStatePropertyAll(SizePadding.horizontalPx16),
    textStyle: WidgetStatePropertyAll(TextStyle(
        fontSize: TextSize.px16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: FontClass.raleway,
        color: ColorPlattes.textDarkPrimary)),
  ));

  // -------------------------- OutlinedButton --------------------------
  //? ------- Light -------
  static OutlinedButtonThemeData outlineLight = OutlinedButtonThemeData(
      style: ButtonStyle(
          alignment: Alignment.center,
          animationDuration: const Duration(milliseconds: 100),
          // elevation: const WidgetStatePropertyAll(3),
          fixedSize: const WidgetStatePropertyAll(
            Size(160, 34),
          ),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          padding: WidgetStatePropertyAll(SizePadding.horizontalPx16),
          side: const WidgetStatePropertyAll(
              BorderSide(width: .6, color: ColorPlattes.buttonColorLight)),
          textStyle: const WidgetStatePropertyAll(TextStyle(
              fontSize: TextSize.px16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              color: ColorPlattes.textLightPrimary))));
  //? ------- Dark -------
  static OutlinedButtonThemeData outlineDark = OutlinedButtonThemeData(
      style: ButtonStyle(
          alignment: Alignment.center,
          animationDuration: const Duration(milliseconds: 100),
          // elevation: const WidgetStatePropertyAll(3),
          fixedSize: const WidgetStatePropertyAll(
            Size(160, 34),
          ),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          padding: WidgetStatePropertyAll(SizePadding.horizontalPx16),
          side: const WidgetStatePropertyAll(
              BorderSide(width: .6, color: ColorPlattes.buttonColorDark)),
          textStyle: const WidgetStatePropertyAll(TextStyle(
              fontSize: TextSize.px14,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              color: ColorPlattes.textDarkPrimary))));

  // -------------------------- textButton --------------------------
  //? ------- Light -------
  static TextButtonThemeData textLight = TextButtonThemeData(
      style: ButtonStyle(
    alignment: Alignment.center,
    animationDuration: const Duration(milliseconds: 100),
    // elevation: const WidgetStatePropertyAll(3),
    // fixedSize: const WidgetStatePropertyAll(
    //   Size(200, 40),
    // ),
    shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    padding: WidgetStatePropertyAll(SizePadding.horizontalPx16),
    textStyle: const WidgetStatePropertyAll(TextStyle(
        fontSize: TextSize.px16,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: ColorPlattes.textLightPrimary)),
  ));
  //? ------- Dark -------
  static TextButtonThemeData textDark = TextButtonThemeData(
      style: ButtonStyle(
    alignment: Alignment.center,
    animationDuration: const Duration(milliseconds: 100),
    // elevation: const WidgetStatePropertyAll(3),
    // fixedSize: const WidgetStatePropertyAll(
    //   Size(200, 40),
    // ),
    shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    padding: WidgetStatePropertyAll(SizePadding.horizontalPx16),
    textStyle: const WidgetStatePropertyAll(TextStyle(
        fontSize: TextSize.px16,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: ColorPlattes.textDarkPrimary)),
  ));

  // -------------------------- textButton --------------------------
  //? ------- Light -------
  static IconButtonThemeData iconLight = IconButtonThemeData(
      style: ButtonStyle(
    alignment: Alignment.center,
    animationDuration: const Duration(milliseconds: 100),
    elevation: const WidgetStatePropertyAll(3),
    // fixedSize: const WidgetStatePropertyAll(
    //   Size(200, 40),
    // ),
    iconColor: const WidgetStatePropertyAll(ColorPlattes.lightSecondary),
    shape: const WidgetStatePropertyAll(CircleBorder()),
    padding: WidgetStatePropertyAll(SizePadding.horizontalPx16),
    textStyle: const WidgetStatePropertyAll(TextStyle(
        fontSize: TextSize.px16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: ColorPlattes.textLightPrimary)),
  ));
  //? ------- Dark -------
  static IconButtonThemeData iconDark = IconButtonThemeData(
      style: ButtonStyle(
    alignment: Alignment.center,
    animationDuration: const Duration(milliseconds: 100),
    elevation: const WidgetStatePropertyAll(3),
    // fixedSize: const WidgetStatePropertyAll(
    //   Size(200, 40),
    // ),
    iconColor: const WidgetStatePropertyAll(ColorPlattes.darkSecondary),
    shape: const WidgetStatePropertyAll(CircleBorder()),
    padding: WidgetStatePropertyAll(SizePadding.horizontalPx16),
    textStyle: const WidgetStatePropertyAll(TextStyle(
        fontSize: TextSize.px16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: ColorPlattes.textDarkPrimary)),
  ));
}
