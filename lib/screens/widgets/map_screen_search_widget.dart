import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate/screens/widgets/animate_widget.dart';
import 'package:real_estate/screens/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class MapScreenSearchWidget extends StatelessWidget {
  const MapScreenSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 6.5.h,
      margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: AnimateWidget(
              delayed: const Duration(milliseconds: 500),
              child: Container(
                // height: 6.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      7.w,
                    )),
                child: const ListTile(
                  minVerticalPadding: 0,
                  leading: Icon(
                    Icons.search,
                  ),
                  title: CustomText(text: "Gbagada"),
                ),
              ),
            ),
          ),
          Flexible(
              child: AnimateWidget(
            delayed: const Duration(milliseconds: 500),
            child: Container(
              margin: EdgeInsets.only(left: 2.w),
              padding: EdgeInsets.all(3.5.w),
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: const Icon(FontAwesomeIcons.sliders),
            ),
          ))
        ],
      ),
    );
  }
}
