import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';

import '../const_providers/color_provider.dart';
import 'widgets/analytic_row.dart';
import 'widgets/animate_widget.dart';
import 'widgets/custom_text.dart';
import 'widgets/fadein_widget.dart';
import 'widgets/home_screen_app_title.dart';
import 'widgets/home_screen_avatar.dart';
import 'widgets/padding_widget.dart';
import 'widgets/rooms_widget.dart';

class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({super.key});

  @override
  State<LandingPageScreen> createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const HomeScreenAppTitle(),
        actions: const [
          AnimateWidget(
              delayed: Duration(seconds: 0), child: HomeScreenAvatar())
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorProvider.startgradientColor,
              ColorProvider.endGradientColor
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 3.h,
            ),
            PaddingWidget(
              child: FadeInWidget(
                child: CustomText(
                  text: "Hi, Marina",
                  fontSize: 19.sp,
                  color: ColorProvider.fadedTextColor,
                ),
              ),
            ),
            PaddingWidget(
              child: FadeInWidget(
                child: CustomText(
                  text: "let's select your perfect place",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            const PaddingWidget(child: AnalyticRow()),
            SizedBox(
              height: 3.h,
            ),
            const RoomsWidget().animate().slide(
                begin: const Offset(1, 1),
                delay: const Duration(seconds: 2),
                duration: const Duration(seconds: 1))
          ],
        ),
      ),
    );
  }
}
