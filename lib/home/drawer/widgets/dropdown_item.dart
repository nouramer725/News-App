import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';
import '../../../utils/responsive.dart';

class DropdownItem extends StatelessWidget {
  final String text;
  final String textItem1;
  final String textItem2;
  final Function(dynamic) onChanged;

  const DropdownItem({
    super.key,
    required this.text,
    required this.textItem1,
    required this.textItem2,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w(16)),
      padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(10)),
      height: h(50),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.whiteColor, width: 2),
      ),
      child: DropdownButton(
        underline: SizedBox(),
        hint: Text(
          text,
          style: AppText.boldText(color: AppColors.whiteColor, fontSize: 16),
        ),
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down),
        items: [
          DropdownMenuItem(value: 1, child: Text(textItem1)),
          DropdownMenuItem(value: 2, child: Text(textItem2)),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
