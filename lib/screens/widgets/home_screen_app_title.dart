import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../const_providers/color_provider.dart';
import 'custom_text.dart';

class HomeScreenAppTitle extends StatefulWidget {
  const HomeScreenAppTitle({super.key});

  @override
  State<HomeScreenAppTitle> createState() => _HomeScreenAppTitleState();
}

class _HomeScreenAppTitleState extends State<HomeScreenAppTitle>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  // late final Animation<double> _animation;
  bool _completed = false;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    _animationController.addListener(_animationListener);
    // _animation =
    //     CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      // elevation: 2,
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, widget) {
            return AnimatedContainer(
              duration: const Duration(microseconds: 500),
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      2.w,
                    ),
                  ),
                  width: _animationController.value * 40.w,
                  child: _completed
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              size: 17.sp,
                              FontAwesomeIcons.locationPin,
                              color: ColorProvider.fadedTextColor,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            CustomText(
                              fontSize: 14.sp,
                              text: "Saint Petersburg",
                              color: ColorProvider.fadedTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        )
                      : Container(
                          height: 15,
                        )),
            );
          }),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _animationListener() {
    if (_animationController.value == 1) {
      setState(() {
        _completed = true;
      });
    }
    // setState(() {
    //   _width = _animationController.value * 40.w;
    // });
  }
}
