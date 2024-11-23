import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SizeAnimationWidget extends StatefulWidget {
  final Widget child;
  const SizeAnimationWidget({required this.child, super.key});

  @override
  State<SizeAnimationWidget> createState() => _SizeAnimationWidgetState();
}

class _SizeAnimationWidgetState extends State<SizeAnimationWidget>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  // late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
    // _animationController.addListener(_animationListener);
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
          builder: (context, widgetAnimated) {
            return AnimatedContainer(
              color: Colors.transparent,
              duration: const Duration(microseconds: 500),
              child: IntrinsicHeight(
                child: Container(
                    // alignment: Alignment.center,
                    color: Colors.white.withOpacity(.2),
                    // padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   borderRadius: BorderRadius.circular(
                    //     3.w,
                    //   ),
                    // ),
                    width: _animationController.value * 100.w,
                    child: widget.child),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // void _animationListener() {
  //   if (_animationController.value == 1) {
  //     setState(() {
  //       _completed = true;
  //     });
  //   }
  //   // setState(() {
  //   //   _width = _animationController.value * 40.w;
  //   // });
  // }
}
