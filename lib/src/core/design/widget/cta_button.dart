import 'package:flutter/material.dart';
import '../theme/theme.dart';

class CtaButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final Widget? icon;
  final double padding;
  final bool? isEnable;
  final Widget? child;
  final EdgeInsetsGeometry? paddingEdge;
  final bool reversIcon;
  final FontWeight fontWeight;
  final double fontSize;
  const CtaButton({
    super.key,
    this.title,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor = AppColor.primaryColor,
    this.foregroundColor,
    this.icon,
    this.padding = 8,
    this.isEnable,
    this.borderColor,
    this.child,
    this.paddingEdge,
    this.reversIcon = false,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    final isEnable = this.isEnable ?? onPressed != null;
    return ElevatedButton(
      onPressed: isLoading || !isEnable ? null : onPressed,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          foregroundColor:
              MaterialStateProperty.all(foregroundColor ?? Colors.white),
          backgroundColor: MaterialStateProperty.all(
              isEnable ? backgroundColor : AppColor.midGrey),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: borderColor == null
                  ? BorderSide.none
                  : BorderSide(color: borderColor!),
              borderRadius: BorderRadius.circular(AppSpace.radius)))),
      child: Padding(
        padding: paddingEdge ?? EdgeInsets.all(padding),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: isLoading ? 1 : 0,
                child: const SizedBox(
                    width: 20, height: 20, child: CircularProgressIndicator())),
            AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: !isLoading ? 1 : 0,
                child: child ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (icon != null && reversIcon)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: 6,
                            ),
                            child: icon!,
                          ),
                        if (title != null)
                          Text(
                            title!,
                            style: TextStyle(
                                fontSize: fontSize, fontWeight: fontWeight),
                          ),
                        if (icon != null && !reversIcon)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 6,
                            ),
                            child: icon!,
                          ),
                      ],
                    )),
          ],
        ),
      ),
    );
  }
}

class AutoLoadingCtaButton extends StatefulWidget {
  final String? title;
  final Future Function()? onPressed;
  final Color backgroundColor;
  final Color? foregroundColor;
  final Widget? icon;
  final double padding;
  final Widget? child;
  final bool reversIcon;
  final Color? borderColor;
  const AutoLoadingCtaButton({
    super.key,
    this.title,
    this.onPressed,
    this.backgroundColor = AppColor.primaryColor,
    this.foregroundColor,
    this.icon,
    this.padding = AppSpace.medium,
    this.child,
    this.reversIcon = false,
    this.borderColor,
  });

  @override
  State<AutoLoadingCtaButton> createState() => _AutoLoadingCtaButtonState();
}

class _AutoLoadingCtaButtonState extends State<AutoLoadingCtaButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return CtaButton(
      title: widget.title,
      reversIcon: widget.reversIcon,
      onPressed: widget.onPressed == null
          ? null
          : () async {
              try {
                setState(() {
                  isLoading = true;
                });
                await widget.onPressed!.call();
              } finally {
                setState(() {
                  isLoading = false;
                });
              }
            },
      isLoading: isLoading,
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.foregroundColor,
      icon: widget.icon,
      borderColor: widget.borderColor,
      padding: widget.padding,
      child: widget.child,
    );
  }
}

class AutoLoadingClickable extends StatefulWidget {
  final Future Function()? onPressed;
  final Widget child;
  final bool isEnable;
  const AutoLoadingClickable(
      {super.key, this.onPressed, required this.child, required this.isEnable});

  @override
  State<AutoLoadingClickable> createState() => _AutoLoadingClickableState();
}

class _AutoLoadingClickableState extends State<AutoLoadingClickable> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    void onTap() async {
      try {
        setState(() {
          isLoading = true;
        });
        await widget.onPressed!.call();
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }

    return InkWell(
      onTap: isLoading || !widget.isEnable ? null : onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: isLoading ? 1 : 0,
              child: const SizedBox(
                  width: 20, height: 20, child: CircularProgressIndicator())),
          AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: !isLoading ? 1 : 0,
              child: widget.child),
        ],
      ),
    );
  }
}
