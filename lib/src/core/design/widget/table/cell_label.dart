import 'package:flutter/widgets.dart';

class CellLabel extends StatelessWidget {
  final String title;
  const CellLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18),
    );
  }
}
