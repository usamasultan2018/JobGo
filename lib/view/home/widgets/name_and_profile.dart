import 'package:flutter/material.dart';

import '../../../constant/colors/app_colors.dart';
class NameAndProfile extends StatelessWidget {
  const NameAndProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Hello\nOrlando Diggs.",style: TextStyle(
          color: AppColors.ultraDarkBlue,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),),
        CircleAvatar(
          radius: 20,
          foregroundImage: AssetImage("assets/image/person.png"),
        )
      ],
    );
  }
}