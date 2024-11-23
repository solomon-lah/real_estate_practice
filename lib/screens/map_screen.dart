import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:real_estate/const_providers/color_provider.dart';
import 'package:real_estate/screens/widgets/custom_text.dart';
import 'package:real_estate/screens/widgets/map_screen_bottom_widget.dart';
import 'package:real_estate/screens/widgets/map_screen_search_widget.dart';
import 'package:sizer/sizer.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  bool _showFull = true;
  @override
  void initState() {
    _doSomething();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(6.5244, 3.3792),
              initialZoom: 11,
              // initialZoom: 3.2,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png",
                // urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                // userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(markers: [
                _marker(
                    point: const LatLng(6.6167, 3.5071), distance: "13 mn P"),
                _marker(
                    point: const LatLng(6.5552, 3.3805), distance: "11.1 mn P"),
                _marker(
                    point: const LatLng(6.6059, 3.3498), distance: "10.1 mn P"),
                _marker(
                    point: const LatLng(6.6423, 3.3430), distance: "12 mn P"),
                _marker(
                    point: const LatLng(6.4281, 3.4215), distance: "15 mn P"),
              ])
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MapScreenSearchWidget(),
              MapScreenBottomWidget(
                iSlayed: !_showFull,
                onTap: () {
                  setState(() {
                    _showFull = false;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Marker _marker({required LatLng point, required String distance}) {
    return Marker(
        width: 25.w,
        point: point,
        height: 5.5.h,
        child: _showFull
            ? AnimatedContainer(
                // width: 25.w,
                duration: const Duration(seconds: 4),
                // padding: const EdgeInsets.all(10),

                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: ColorProvider.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3.w),
                    topRight: Radius.circular(3.w),
                    bottomRight: Radius.circular(3.w),
                  ),
                ),
                child: Center(
                  child: CustomText(
                    textAlign: TextAlign.center,
                    text: distance,
                    color: Colors.white,
                  ),
                ),
              ).animate().scaleX(
                begin: 0,
                end: 1,
                curve: Curves.easeIn,
                alignment: Alignment.bottomLeft,
                delay: const Duration(seconds: 2),
                duration: const Duration(milliseconds: 800))
            : AnimatedContainer(
                duration: const Duration(seconds: 4),
                // padding: const EdgeInsets.all(10),

                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: ColorProvider.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3.w),
                    topRight: Radius.circular(3.w),
                    bottomRight: Radius.circular(3.w),
                  ),
                ),
                child: Center(
                    child: Icon(
                  FontAwesomeIcons.buildingColumns,
                  size: 21.sp,
                  color: Colors.white,
                )),
              ).animate().scaleX(
                begin: 1,
                end: .6,
                curve: Curves.easeIn,
                alignment: Alignment.bottomLeft,
                duration: const Duration(milliseconds: 800)));
  }

  void _doSomething() {
    // Future.delayed(Duration(seconds: 5)).then((value) {
    //   setState(() {
    //     _showFull = false;
    //   });
    // });
  }
}
