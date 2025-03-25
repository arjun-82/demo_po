import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  final String? companyName,
      location,
      role,
      dateOfJ,
      dateOfL,
      totalExp,
      description;
  const ExperienceCard({
    super.key,
    this.companyName,
    this.location,
    this.role,
    this.dateOfJ,
    this.description,
    this.dateOfL,
    this.totalExp,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      color: darkMode ? ColorPlattes.dark : ColorPlattes.light,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 5,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            top: -70,
            left: -180,
            child: SvgPicture.asset(
              darkMode
                  ? "assets/svg/darkmodeExp.svg"
                  : "assets/svg/lightmodeExp.svg",
              height: 220,
              width: 170,
            ),
          ),
          Positioned(
            bottom: -90,
            right: -180,
            child: SvgPicture.asset(
              darkMode
                  ? "assets/svg/darkmodeExp.svg"
                  : "assets/svg/lightmodeExp.svg",
              height: 220,
              width: 170,
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            // left: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(HugeIcons.strokeRoundedLink04),
              tooltip: "https://www.doctosmart.com/index.html",
            ),
          ),
          Center(
            child: Padding(
              padding: SizePadding.allPx16,
              child: Column(
                children: [
                  Text(
                    companyName ?? "Doctosmart Enterprises Pvt.Ltd",
                    style: const TextStyle(
                        fontSize: TextSize.px20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    location ?? "Calicut, Kerala",
                    style: const TextStyle(
                      fontSize: TextSize.px14,
                    ),
                  ),
                  Text(
                    role ?? "Internship - Flutter Developer",
                    style: const TextStyle(
                        fontSize: TextSize.px16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        dateOfJ ?? "Nov 2023",
                        style: const TextStyle(
                          fontSize: TextSize.px10,
                        ),
                      ),
                      const Text(
                        " - ",
                      ),
                      Text(
                        dateOfL ?? "feb 2024",
                        style: const TextStyle(fontSize: TextSize.px10),
                      ),
                      Text(
                        " ($totalExp)",
                        style: const TextStyle(fontSize: TextSize.px10),
                      ),
                    ],
                  ),
                  Spacing.heightPx8,
                  Text(
                    description ??
                      "Worked as an intern at DoctoSmart Enterprises Pvt.Ltd. Contributed to the development of a telemedicine app using Flutter.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: TextSize.px12,
                      color: darkMode
                          ? ColorPlattes.textDarkLabel
                          : ColorPlattes.textLightLabel,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
