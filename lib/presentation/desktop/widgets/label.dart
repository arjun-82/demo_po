import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class DetailsLabel extends StatelessWidget {
  const DetailsLabel({
    super.key,
    required this.darkMode,
    required this.title,
    required this.icon,
    this.onTap, this.text,
  });

  final bool darkMode;
  final String title;final String? text;
  final IconData icon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        hoverColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          icon: Icon(
            icon,
            opticalSize: 18,
            color:
                darkMode ? ColorPlattes.darkPrimary : ColorPlattes.lightPrimary,
          ),
          tooltip: text,
        ),
        title: Text(
          title,
          style: TextStyle(
            // fontFamily: FontClass.outfit,
            color: darkMode
                ? ColorPlattes.textDarkPrimary
                : ColorPlattes.textLightPrimary,
            fontWeight: FontWeight.w500,
            fontSize: TextSize.px14,
          ),
        ));
  }
}
