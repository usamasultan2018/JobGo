import 'package:flutter/material.dart';

import '../../../constant/colors/app_colors.dart';
class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color? bckColor;
  const MyButton({
    super.key, required this.onTap, required this.child,this.bckColor =AppColors.darkBlue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: bckColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: child,
      ),
    );
  }
}