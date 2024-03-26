import 'package:flutter/material.dart';
import 'package:jobgo/constant/colors/app_colors.dart';
import 'package:jobgo/view/home/widgets/find_your_job.dart';
import 'package:jobgo/view/home/widgets/home_banner.dart';
import 'package:jobgo/view/home/widgets/name_and_profile.dart';
import 'package:jobgo/view/home/widgets/recent_job_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // user name nd profile.
                NameAndProfile(),
                SizedBox(
                  height: 20,
                ),
                //Banner...
                HomeBanner(),
                SizedBox(
                  height: 20,
                ),
                // Find your job...
                SizedBox(
                  height: 20,
                ),
                FindYourJob(),
                SizedBox(
                  height: 10,
                ),
                // Recent job..
               RecentJobList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}





