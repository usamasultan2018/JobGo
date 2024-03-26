import 'package:flutter/material.dart';

import '../../../constant/colors/app_colors.dart';
class RecentJobList extends StatelessWidget {
  const RecentJobList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recent Job List",style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),),

        SizedBox(height: 10,),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.1,0.1),
                  blurRadius: 6.2,
                  spreadRadius: 0.1,
                  color: Color(0xff99ABC6).withOpacity(0.6),
                )
              ]

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.red,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product Designer",style: TextStyle(
                            color: AppColors.ultraDarkBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),),
                          Text("Google inc.California, USA",style: TextStyle(
                            color: AppColors.blueGrey,

                            fontSize: 12,
                          ),)
                        ],
                      ),

                    ],
                  ),
                  Icon(Icons.bookmark_border_outlined,color: AppColors.blueGrey,size: 30,),
                ],
              ),
              SizedBox(height: 20,),
              Text("\$15K",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue
              ),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xffCBC9D4),
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child:Text("Senior designer",style: TextStyle(
                        fontSize: 10,
                        color: AppColors.blueGrey,
                      ),)
                  ),
                  SizedBox(width: 8,),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xffCBC9D4),
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child:Text("Senior designer",style: TextStyle(
                        fontSize: 10,
                        color: AppColors.blueGrey,
                      ),)
                  ),
                  SizedBox(width: 8,),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xffFF6B2C),
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child:Text("Apply",style: TextStyle(
                        fontSize: 10,
                        color: AppColors.blueGrey,
                      ),)
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}