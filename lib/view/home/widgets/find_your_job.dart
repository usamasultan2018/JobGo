import 'package:flutter/material.dart';

import '../../../constant/colors/app_colors.dart';

class FindYourJob extends StatelessWidget {
  const FindYourJob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Find Your Job",style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 33,horizontal: 25),
              decoration: BoxDecoration(
                color: Color(0xffAFECFE),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: [
                  Image.asset("assets/icons/searchjob_icon.png",width: 34,height: 34,),
                  SizedBox(height: 10,),
                  Text("44.5k",style: TextStyle(
                    color: AppColors.ultraDarkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  SizedBox(height: 5,),
                  Text("Remote Job",style: TextStyle(
                    fontSize: 14,

                  ),)
                ],
              ),
            ),
            SizedBox(width: 20,),
            Column(

              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                  decoration: BoxDecoration(
                    color: Color(0xffBEAFFE),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Text("66.5k",style: TextStyle(
                        color: AppColors.ultraDarkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                      SizedBox(height: 5,),
                      Text("Full Time",style: TextStyle(
                        fontSize: 14,
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                  decoration: BoxDecoration(
                    color: Color(0xffFFD6AD),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Text("48.5k",style: TextStyle(
                        color: AppColors.ultraDarkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                      SizedBox(height: 5,),
                      Text("Part Time",style: TextStyle(
                        fontSize: 14,
                      ),)
                    ],
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}