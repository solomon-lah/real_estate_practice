import 'package:flutter/material.dart';
import 'package:real_estate/const_providers/color_provider.dart';
import 'package:sizer/sizer.dart';

import '../../const_providers/asset_image_provider.dart';

class HomeScreenAvatar extends StatelessWidget {
  const HomeScreenAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 2.w,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.w),
        child: Container(
          alignment: Alignment.bottomCenter,
          color: ColorProvider.primaryColor,
          height: 50,
          width: 50,
          // padding: EdgeInsets.all(1.w),

          child: Image.asset(AssetImageProvider.avatarImage),
        ),
      ),
    );
  }
}
