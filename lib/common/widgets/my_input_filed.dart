import 'package:flutter/material.dart';
import '../../core/config/theme/app_colors.dart';
import '../../core/config/theme/app_text.dart';

class MyInputFiled extends StatelessWidget {
  const MyInputFiled({super.key, required this.label, required this.hintText, required this.textEditingController});
final String label;
final String hintText;
final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            label,
            style: AppText.headH5.copyWith(color: AppColors.headingText),
          ),
        ),
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText:hintText,
          ).applyDefaults(
            Theme.of(context).inputDecorationTheme,
          ),
        ),
      ],
    );
  }
}
