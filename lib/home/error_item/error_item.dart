import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_colors.dart';

class ErrorItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ErrorItem({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text, style: Theme.of(context).textTheme.labelSmall),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).splashColor,
            ),
            child: Text(
              AppLocalizations.of(context)!.try_again,
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
