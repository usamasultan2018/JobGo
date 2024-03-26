import 'package:flutter/material.dart';

import '../../../constant/colors/app_colors.dart';
class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "50% off\ntake any courses",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.darkYellow,
                  ),
                  child: Text(
                    "Join now",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/female.png"),
                    fit: BoxFit.fill,
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}