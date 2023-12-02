import 'package:flutter/material.dart';

import '../constats.dart';

class PageIndicatorIcon extends StatelessWidget {
  const PageIndicatorIcon({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(18)),
        child: Icon(
          icon,
          color: Colours.scaffoldColor,
        ));
  }
}