import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tastewing/Widgets/profile/recipe.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.only(top: 0),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'UserName',
                  style: TextStyle(
                      color: HexColor('#3E5481'),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '32',
                      style: TextStyle(
                          color: HexColor('#3E5481'),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Recipes',
                      style: TextStyle(
                          color: HexColor('#3E5481'),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                SizedBox(
                  width: 55.w,
                ),
                Column(
                  children: [
                    Text(
                      '789',
                      style: TextStyle(
                          color: HexColor('#3E5481'),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                          color: HexColor('#3E5481'),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                SizedBox(width: 50.w),
                Column(
                  children: [
                    Text(
                      '1289',
                      style: TextStyle(
                          color: HexColor('#3E5481'),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                          color: HexColor('#3E5481'),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Divider(
              color: HexColor('#F4F5F7'),
              thickness: 4,
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Recipes',
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: HexColor('#3E5481'),
                        fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(height: 16.h),
            Divider(
                color: HexColor('#1FCC79'),
                thickness: 5,
                indent: 2,
                endIndent: 5),
            SizedBox(height: 20.h),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 0),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 32.h,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 0.95),
                itemBuilder: (ctx, index) => SingleRecipe(),
                itemCount: 6,
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ]),
    );
  }
}
