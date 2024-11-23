import 'package:flutter/material.dart';
import 'package:real_estate/const_providers/color_provider.dart';
import 'package:sizer/sizer.dart';

class NavigationIcon extends StatelessWidget {
  final IconData iconData;
  final bool isActive;
  const NavigationIcon(
      {required this.iconData, this.isActive = false, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.all(isActive ? 3.5.w : 2.5.w),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive
              ? ColorProvider.primaryColor
              : ColorProvider.floatingActionBtnColor),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 17.sp,
      ),
    );
  }
}
