import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.whiteColor,
      thickness: 2,
      indent: 20,
      endIndent: 20,
    );
  }
}
