import 'package:flutter/material.dart';
import 'package:wms/gen/assets.gen.dart';

class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.png.logo.provider(),
          fit: BoxFit.contain,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
