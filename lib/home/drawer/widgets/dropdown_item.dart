import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';
import '../../../utils/responsive.dart';

class DropdownItem extends StatelessWidget {
  final String text;
  final String textItem1;
  final String textItem2;
  final Function()? onTapItem1;
  final Function()? onTapItem2;
  final Function(dynamic) onChanged;
  final IconData icon1;
  final IconData icon2;

  const DropdownItem({
    super.key,
    required this.text,
    required this.textItem1,
    required this.textItem2,
    required this.onTapItem1,
    required this.onTapItem2,
    required this.onChanged,
    required this.icon1,
    required this.icon2,
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
        dropdownColor: AppColors.blackColor,
        underline: SizedBox(),
        hint: Text(
          text,
          style: AppText.boldText(color: AppColors.whiteColor, fontSize: 16),
        ),
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down),
        items: [
          DropdownMenuItem(
            value: 1,
            onTap: onTapItem1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textItem1,
                  style: AppText.semiBoldText(
                    color: AppColors.whiteColor,
                    fontSize: 14,
                  ),
                ),
                Icon(icon1,color: AppColors.whiteColor,),
              ],
            ),
          ),
          DropdownMenuItem(
            value: 2,
            onTap: onTapItem2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textItem2,
                  style: AppText.semiBoldText(
                    color: AppColors.whiteColor,
                    fontSize: 14,
                  ),
                ),
                Icon(icon2,color: AppColors.whiteColor,),
              ],
            ),
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
