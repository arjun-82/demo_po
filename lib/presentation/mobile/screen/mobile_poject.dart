// import 'package:arjun_portfolio/utils/index_utils.dart';
// import 'package:flutter/material.dart';

// class MobileProject extends StatelessWidget {
//   const MobileProject({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final ExapndController controller = Get.put(ExapndController());
//     final fetchController = Get.put(PortfolioController());

//     final darkMode = Theme.of(context).brightness == Brightness.dark;

//     final project = fetchController.portfolios;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Obx(() {
//           final displayCount = controller.showAll.value
//               ? project!.length
//               : (project!.length > 2 ? 2 : project.length);
//           return AnimatedSize(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//             child: Column(
//               children: List.generate(displayCount, (index) {
//                 final items = project[index].projects![index];
//                 return MobileProjectCard(
//                   title: items.name,
//                   description: items.description,
//                   imageUrl: items.imageUrl,
//                 );
//               }),
//             ),
//           );
//         }),
//         if (project!.length > 2) Spacing.heightPx16,
//         Obx(() => SizedBox(
//               width: 100,
//               height: 30,
//               child: OutlinedButton(
//                 onPressed: controller.toggleProjects,
//                 style: ButtonStyle(
//                   side: WidgetStateProperty.all(
//                     const BorderSide(color: ColorPlattes.buttonColorLight),
//                   ),
//                 ),
//                 child: Text(
//                   controller.showAll.value ? "Minimize" : "Expand",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontFamily: "Raleway",
//                     fontWeight: FontWeight.w500,
//                     color: darkMode
//                         ? ColorPlattes.textDarkPrimary
//                         : ColorPlattes.textLightPrimary,
//                   ),
//                 ),
//               ),
//             )),
//       ],
//     );
//   }
// }
