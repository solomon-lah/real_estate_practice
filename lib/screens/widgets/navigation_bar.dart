import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate/screens/widgets/navigation_icon.dart';

// ignore: must_be_immutable
class AppNavigationBar extends StatefulWidget {
  int index;
  final void Function(int index)? onTap;
  AppNavigationBar({required this.index, this.onTap, super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              _changeValue(0);
            },
            child: NavigationIcon(
              iconData: FontAwesomeIcons.magnifyingGlass,
              isActive: widget.index == 0,
            ),
          ),
          const NavigationIcon(iconData: FontAwesomeIcons.comment),
          InkWell(
            onTap: () {
              _changeValue(1);
            },
            child: NavigationIcon(
              iconData: FontAwesomeIcons.house,
              isActive: widget.index == 1,
            ),
          ),
          const NavigationIcon(iconData: FontAwesomeIcons.heart),
          const NavigationIcon(iconData: FontAwesomeIcons.user),
        ],
      ),
    );
  }

  void _changeValue(int value) {
    if (widget.onTap != null) {
      widget.onTap!(value);
    }
  }
}
