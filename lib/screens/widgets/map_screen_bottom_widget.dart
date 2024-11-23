import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate/const_providers/color_provider.dart';
import 'package:real_estate/screens/widgets/animate_widget.dart';
import 'package:real_estate/screens/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class MapScreenBottomWidget extends StatefulWidget {
  final void Function() onTap;
  final bool iSlayed;
  const MapScreenBottomWidget(
      {required this.onTap, required this.iSlayed, super.key});

  @override
  State<MapScreenBottomWidget> createState() => _MapScreenBottomWidgetState();
}

class _MapScreenBottomWidgetState extends State<MapScreenBottomWidget>
    with TickerProviderStateMixin {
  final OverlayPortalController _overlayPortalController =
      OverlayPortalController();
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
              child: Column(
            children: [
              InkWell(
                onTap: () {
                  if (_overlayPortalController.isShowing) {
                    return;
                  }
                  _overlayPortalController.toggle();
                },
                child: OverlayPortal(
                    controller: _overlayPortalController,
                    overlayChildBuilder: (context) {
                      return Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                                height: 25.h,
                                width: 50.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.5.h, horizontal: 2.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(2.w)),
                                margin:
                                    EdgeInsets.only(bottom: 18.h, left: 5.w),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    _overlayItem(
                                        iconData: Icons.verified_user,
                                        label: "Cosy areas"),
                                    _overlayItem(
                                        iconData: FontAwesomeIcons.briefcase,
                                        color: ColorProvider.primaryColor,
                                        label: "Price"),
                                    _overlayItem(
                                        iconData: FontAwesomeIcons.bucket,
                                        label: "Infrastructure"),
                                    InkWell(
                                      onTap: () {
                                        if (!_overlayPortalController
                                            .isShowing) {
                                          return;
                                        }
                                        widget.onTap();
                                        _animationController
                                            .animateBack(0)
                                            .then((value) =>
                                                _overlayPortalController
                                                    .toggle());
                                      },
                                      child: _overlayItem(
                                          iconData: FontAwesomeIcons.layerGroup,
                                          label: "Without any layer"),
                                    )
                                  ],
                                ))
                            .animate(controller: _animationController)
                            .scaleXY(
                              alignment: Alignment.centerLeft,
                              duration: const Duration(milliseconds: 500),
                            ),
                      );
                    },
                    child: _leftColumnItem(
                        iconData: widget.iSlayed
                            ? FontAwesomeIcons.layerGroup
                            : FontAwesomeIcons.tags)),
              ),
              SizedBox(
                height: 1.h,
              ),
              _leftColumnItem(iconData: FontAwesomeIcons.locationArrow),
            ],
          )),
          Flexible(
            child: AnimateWidget(
              delayed: const Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 1.h,
                  horizontal: 2.w,
                ),
                width: 37.w,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.4),
                    borderRadius: BorderRadius.circular(
                      7.w,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Flexible(
                      child: Icon(
                        Icons.list,
                        color: Colors.white,
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: CustomText(
                        text: "List of variants",
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _leftColumnItem({required IconData iconData}) {
    return AnimateWidget(
      delayed: const Duration(milliseconds: 500),
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.4), shape: BoxShape.circle),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _overlayItem(
      {required IconData iconData, required String label, Color? color}) {
    return Row(
      children: [
        Flexible(
          child: Icon(
            iconData,
            color: color ?? ColorProvider.fadedTextColor,
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(
              left: 2.w,
            ),
            child: CustomText(
              text: label,
              color: color ?? ColorProvider.fadedTextColor,
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
