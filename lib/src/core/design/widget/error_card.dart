import 'package:flutter/material.dart';
import 'package:wms/src/core/utils/extensions/extensions.dart';

class ErrorCard extends StatelessWidget {
  final Object? error;
  final VoidCallback? onRetry;
  final bool isLoading;
  const ErrorCard(
      {super.key, required this.error, this.onRetry, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onRetry,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(error.toString()),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Visibility.maintain(
                      visible: isLoading,
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    Visibility.maintain(
                      visible: !isLoading,
                      //TODO
                      child: Text(context.translator.unknownError),
                    ),
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
