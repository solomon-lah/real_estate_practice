import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FadeInWidget extends StatefulWidget {
  final Widget child;
  const FadeInWidget({required this.child, super.key});

  @override
  State<FadeInWidget> createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget> {
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(duration: Duration(seconds: 2), delay: Duration(seconds: 1))
      ],
      child: widget.child,
    );
  }
}
