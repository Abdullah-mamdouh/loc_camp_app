import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loc_camp_app/core/helpers/spacing.dart';
import 'package:loc_camp_app/core/theming/colors.dart';
import 'package:loc_camp_app/core/theming/styles.dart';
import 'package:loc_camp_app/features/users/data/models/user_model.dart';

class UserCardWidget extends StatelessWidget {
  UserCardWidget({Key? key,required this.user}) : super(key: key);
  UserModel user;
  @override
  Widget build(BuildContext context) {
    int userImage = Random().nextInt(5) + 1;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
          color: ColorsManager.mainColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorsManager.mainColor, width: 0.2)),
      padding: EdgeInsets.all(10.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(90.sp),
            child: Image(
              image: AssetImage('images/users/user${userImage}.png'),
              fit: BoxFit.cover,
              height: 70.h,
              width: 70.w,
            ),
          ),
          horizontalSpace(5),

          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      user.name.toString(),
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyles.font24BlackBold,
                  ),),
                  Text(
                    '${user.phone}',
                    style: TextStyles.font15DarkBlueMedium,
                  ),
                ],
              ),
              Text(
                ' ${user.email}',
                style: TextStyles.font13DarkBlueMedium,
              ),
              verticalSpace(10),
              Row(
                children: [
                  Icon(Icons.location_on, color: ColorsManager.lightGray,),
                  Text(
                    ' ${user.address?.street!}',
                    style: TextStyles.font14GrayRegular,
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
