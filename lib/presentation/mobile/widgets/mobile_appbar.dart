import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class MoblieAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MoblieAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SizePadding.horizontalPx16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Arjun Portfolio",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: TextSize.px16,
                fontFamily: FontClass.dancingScript),
          ),
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedMenu03),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          )
        ],
      ),
    );
  }
}
