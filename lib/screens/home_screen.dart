import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate/const_providers/color_provider.dart';
import 'package:real_estate/screens/landing_page_screen.dart';
import 'package:real_estate/screens/map_screen.dart';
import 'package:real_estate/screens/widgets/navigation_bar.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IndexedStack(
          index: _index,
          children: [
            _index == 0
                ? const MapScreen()
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 500))
                : Container(),
            const LandingPageScreen()
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 2.5.h),
            padding: EdgeInsets.symmetric(
              horizontal: 1.w,
              vertical: .5.h,
            ),
            width: 70.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: ColorProvider.floatingActionBtnColor.withOpacity(.9)),
            child: AppNavigationBar(
              index: _index,
              onTap: (index) {
                setState(() {
                  _index = index;
                });
              },
            ),
          ),
        ).animate().slide(
            begin: const Offset(0, 1),
            duration: const Duration(
              seconds: 2,
            ),
            delay: const Duration(seconds: 3)),
      ],
    );
  }
}
