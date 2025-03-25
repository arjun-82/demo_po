import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  Experience({super.key}) {
    portfolioController.fetchPortfolios(); // Trigger data fetch here
  }

  final PortfolioController portfolioController =
      Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final portfolio = portfolioController.portfolios;

      if (portfolio.isEmpty) {
        return const Center(child: Text("No Experience Available"));
      }

      return SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              crossAxisSpacing: Spacing.px16,
              mainAxisSpacing: Spacing.px16,
              mainAxisExtent: 220,
            ),
            itemCount: portfolio.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final experience = portfolio[index].experience![index];
              return ExperienceCard(
                companyName: experience.company ?? "Unknown Company",
                role: experience.role ?? "Unknown Role",
                location: experience.location ?? "Unknown Location",
                dateOfL: experience.endDate.toString(),
                dateOfJ: experience.startDate.toString(),
              );
            },
          ));
    });
  }
}
