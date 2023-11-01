import 'package:flutter/widgets.dart';

abstract class AppSpace {
  static const radius = 8.0;

  static const xSmall = 4.0;
  static const small = 8.0;
  static const medium = 16.0;
  static const xMedium = 24.0;
  static const large = 32.0;

  static const paddingXSmall = EdgeInsets.all(xSmall);
  static const paddingSmall = EdgeInsets.all(small);
  static const paddingMedium = EdgeInsets.all(medium);
  static const paddingXMedium = EdgeInsets.all(xMedium);
  static const paddingLarge = EdgeInsets.all(large);

  static const spaceXSmall = SizedBox.square(dimension: xSmall);
  static const spaceSmall = SizedBox.square(dimension: small);
  static const spaceMedium = SizedBox.square(dimension: medium);
  static const spaceXMedium = SizedBox.square(dimension: xMedium);
  static const spaceLarge = SizedBox.square(dimension: large);
}
