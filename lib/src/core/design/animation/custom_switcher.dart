import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class CustomHorizontalSwitcher extends HookWidget {
  final bool isLeft;
  final Widget child;
  final bool enableFade;
  final Alignment alignment;
  const CustomHorizontalSwitcher(
      {super.key,
      required this.isLeft,
      required this.child,
      this.enableFade = true,
      this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) {
    final double offset = isLeft ? 1 : -1;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 600),
      layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
        return Stack(
          alignment: alignment,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      transitionBuilder: _transitionBuilder(Offset(offset, 0), enableFade),
      key: key,
      child: child,
    );
  }
}

AnimatedSwitcherTransitionBuilder _transitionBuilder(
  Offset offset,
  bool enableFade,
) =>
    (final child, final animation) {
      bool isReversed = animation.status.isReversed;

      return SlideTransition(
        position: Tween<Offset>(
          begin: isReversed ? offset.scale(-1, -1) : offset,
          end: Offset.zero,
        ).animate(animation),
        child: enableFade
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : child,
      );
    };

extension AnimationStatusExtension on AnimationStatus {
  bool get isReversed =>
      this == AnimationStatus.completed || this == AnimationStatus.reverse;
}
