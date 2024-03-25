import 'package:flutter/material.dart';

import '../../../constant/colors/app_colors.dart';

class MyTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final IconButton? iconButton;
  final TextEditingController controller;
  final bool obscureText;
  final FormFieldValidator validator;

  const MyTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.validator, this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xff0D0140),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: iconButton,
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              fontSize: 12,
              color: AppColors.ultraDarkBlue.withOpacity(0.6),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.transparent,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.blueGrey, width: 0.5)),
          ),
        )
      ],
    );
  }
}
