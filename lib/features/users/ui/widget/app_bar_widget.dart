
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loc_camp_app/core/theming/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 65,
      backgroundColor: ColorsManager.mainColor.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50.sp),
        ),
      ),
      title: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/users/user4.png'),),
          ),
          Text(
            "Abdullah ",
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}
