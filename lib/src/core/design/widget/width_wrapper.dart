import 'package:flutter/material.dart';

class WidthWrapper extends StatelessWidget {
  final Widget child;
  const WidthWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
