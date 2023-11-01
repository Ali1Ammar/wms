import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';

class AnimatedHide extends StatelessWidget {
  final bool show;
  final Widget child;

  const AnimatedHide({super.key, required this.show, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSizeAndFade.showHide(
      show: show,
      child: child,
    );
  }
}
