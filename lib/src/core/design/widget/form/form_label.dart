import 'package:flutter/material.dart';
import 'package:wms/src/core/design/theme/theme.dart';

class FormLabelTitle extends StatelessWidget {
  final String title;
  final String? label;
  final Color? labelColor;
  const FormLabelTitle({
    super.key,
    required this.title,
    this.label,
    this.labelColor = AppColor.blackish,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: title,
        style: const TextStyle(
            color: AppColor.blackish,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
      if (label != null)
        TextSpan(
          text: " ($label)",
          style: TextStyle(
              color: labelColor, fontSize: 15, fontWeight: FontWeight.w400),
        )
    ], style: Theme.of(context).textTheme.titleLarge));
  }
}

class FormSectionTitle extends StatelessWidget {
  final String title;
  const FormSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class FormTitleWithChild extends StatelessWidget {
  final String title;
  final Widget? child;
  final List<Widget>? children;
  const FormTitleWithChild(
      {super.key, required this.title, this.child, this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabelTitle(title: title),
        const SizedBox(
          height: 8,
        ),
        child ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (children == null)
                  ? <Widget>[]
                  : children!.take(children!.length - 1).fold(
                      [],
                      (previousValue, element) => previousValue
                        ..addAll([
                          element,
                          const SizedBox(
                            height: 16,
                          )
                        ]))
                ..add(children!.last),
            ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class FormSmallLabelTitle extends StatelessWidget {
  final String title;
  final String? label;
  const FormSmallLabelTitle({
    super.key,
    required this.title,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: title,
        style: const TextStyle(
            color: AppColor.midGrey, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      if (label != null)
        TextSpan(
          text: " ($label)",
          style: const TextStyle(
              color: AppColor.midGrey,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        )
    ], style: Theme.of(context).textTheme.titleLarge));
  }
}
