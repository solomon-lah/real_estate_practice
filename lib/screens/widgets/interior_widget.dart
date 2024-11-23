import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate/screens/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class InteriorWidget extends StatelessWidget {
  final String assetImage;
  final String label;
  final bool isLarger;
  const InteriorWidget(
      {required this.assetImage,
      required this.label,
      this.isLarger = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.w),
            child: Image.asset(
              assetImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 0.5.h,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: isLarger
                        ? EdgeInsets.zero
                        : EdgeInsets.only(
                            left: 2.w,
                          ),
                    height: isLarger ? 6.4.h : 5.4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.w),
                      color: Colors.white.withOpacity(.65),
                    ),
                    margin: EdgeInsets.only(
                      bottom: isLarger ? 1.1.h : 1.4.h,
                      left: 4.w,
                      right: 4.w,
                    ),
                    child: Row(
                      mainAxisAlignment: isLarger
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 3,
                          child: CustomText(
                            text: label,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ).animate().scaleX(
                        alignment: Alignment.bottomLeft,
                        delay: const Duration(seconds: 3),
                        duration: const Duration(seconds: 1),
                      ),
                ),
                Container(
                    // width: 200.w,
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: isLarger ? 1.3.h : 1.1.h,
                        right: 5.w,
                      ),
                      height: 6.h,
                      width: isLarger ? 12.w : 9.w,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.navigate_next),
                    )).animate().slideX(
                    begin: -0.87,
                    // begin:
                    //     Offset(-1, 0), // Point A: Start from outside the left
                    // end: Offset(0.5, 0.5), // Point B: End in the center-right
                    delay: const Duration(seconds: 3),
                    duration: const Duration(seconds: 1)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
