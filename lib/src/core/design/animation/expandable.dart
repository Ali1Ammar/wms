import 'package:flutter/material.dart';
import 'package:wms/src/core/design/animation/animated_hide.dart';

class Expandable extends StatefulWidget {
  final Widget? fixedChild;
  final Widget Function(bool isExpanded)? builderHeader;
  final Widget? expandedChild;
  final Widget Function(bool isCollapsed)? expandedBuilder;

  final Widget Function(Widget child)? builder;
  final bool defaultIsCollapsed;
  const Expandable(
      {super.key,
      this.fixedChild,
      this.expandedChild,
      this.expandedBuilder,
      required this.builder,
      this.builderHeader,
      this.defaultIsCollapsed = false});

  @override
  State<Expandable> createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> {
  late bool isCollapsed = widget.defaultIsCollapsed;
  @override
  Widget build(BuildContext context) {
    final builder = widget.builder ?? (child) => child;
    return GestureDetector(
      onTap: () {
        setState(() {
          isCollapsed = !isCollapsed;
        });
      },
      child: builder(Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.fixedChild != null) widget.fixedChild!,
          if (widget.builderHeader != null) widget.builderHeader!(isCollapsed),
          AnimatedHide(
            show: isCollapsed,
            child: widget.expandedChild ?? widget.expandedBuilder!(isCollapsed),
          )
        ],
      )),
    );
  }
}
