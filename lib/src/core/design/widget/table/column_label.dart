import 'package:flutter/widgets.dart';

class ColumnLabel extends StatelessWidget {
  final String title;
  const ColumnLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
