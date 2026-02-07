import 'package:flutter/material.dart';
import 'package:news_app/utils/responsive.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final String image;

  const DrawerItem({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(16)),
      child: Row(
        spacing: w(10),
        children: [
          Image.asset(image),
          Text(
            text,
            style: AppText.boldText(color: AppColors.whiteColor, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
