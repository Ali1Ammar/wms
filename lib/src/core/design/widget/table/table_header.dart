import 'package:flutter/material.dart';
import 'package:wms/src/core/design/theme/space.dart';

class TableHeader extends StatelessWidget {
  final String header;
  final List<Widget> action;
  const TableHeader({super.key, required this.header, required this.action});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(AppSpace.small),
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              header,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: action,
            )
          ],
        ),
      ),
    );
  }
}
