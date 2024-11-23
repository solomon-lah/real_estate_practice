import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimateWidget extends StatefulWidget {
  final Widget child;
  final Duration delayed;
  const AnimateWidget(
      {required this.child,
      this.delayed = const Duration(seconds: 1),
      super.key});

  @override
  State<AnimateWidget> createState() => _AnimateWidgetState();
}

class _AnimateWidgetState extends State<AnimateWidget> {
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        ScaleEffect(duration: const Duration(seconds: 1), delay: widget.delayed)
      ],
      child: widget.child,
    );
  }
}
