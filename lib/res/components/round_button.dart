import 'package:exceptions_handle/res/app_colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.onPress,
      required this.title,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: AppColors.whiteColor,
                )
              : Text(
                  title,
                  style: const TextStyle(color: AppColors.whiteColor),
                ),
        ),
      ),
    );
  }
}
