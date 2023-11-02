import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/core/design/widget/error_card.dart';

class AsyncHandlerWidget<T, V> extends StatelessWidget {
  final AsyncValue<T> asyncValue;
  final Widget Function(T data) builder;
  final Widget Function(Object error)? errorBuilder;
  final String? Function(V)? customErrorMessageBuilder;
  final Widget Function()? loadingBuilder;
  final VoidCallback? onRetry;
  final bool scaffoldEdgeCase;
  const AsyncHandlerWidget({
    super.key,
    required this.asyncValue,
    required this.builder,
    this.errorBuilder,
    this.loadingBuilder,
    this.onRetry,
    this.customErrorMessageBuilder,
    this.scaffoldEdgeCase = false,
  });

  @override
  Widget build(BuildContext context) {
    return switch (asyncValue) {
      AsyncLoading() => loadingBuilder?.call() ??
          const Center(
            child: CircularProgressIndicator(),
          ),
      AsyncError(error: var error) => errorBuilder?.call(error) ??
          ErrorCard(
            isLoading: asyncValue.isLoading,
            error: error,
            onRetry: asyncValue.isLoading ? null : onRetry,
          ),
      AsyncData(value: var value) => builder(value),
      AsyncValue() => const Text("..."),
    };
  }
}
