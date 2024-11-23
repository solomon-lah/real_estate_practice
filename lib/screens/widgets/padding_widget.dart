import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class PaddingWidget extends StatelessWidget {
  final Widget child;
  const PaddingWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        // vertical: 2.h,
      ),
      child: child,
    );
  }
}
