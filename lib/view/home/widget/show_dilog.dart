import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final List<Widget> children;
  final double? top;
  final double? left;
  final double? right;
  final bool showCloseButton;
  final VoidCallback? onClose;
  final Color? backgroundColor;
  final EdgeInsets contentPadding;
  final double borderRadius;
  final double elevation;

  const CustomDialog({
    Key? key,
    required this.children,
    this.top,
    this.left,
    this.right,
    this.showCloseButton = true,
    this.onClose,
    this.backgroundColor,
    this.contentPadding = const EdgeInsets.all(16),
    this.borderRadius = 4,
    this.elevation = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: const Color.fromARGB(40, 0, 0, 0).withOpacity(0),
            ),
          ),
        ),
        Positioned(
          top: top ?? Get.height * 0.2,
          left: left ?? Get.width * 0.01,
          right: right ?? Get.width * 0.01,
          child: AlertDialog(
            backgroundColor: backgroundColor ?? 
              (Get.context!.theme.brightness == Brightness.dark
                ? Colors.black
                : Colors.white),
            contentPadding: const EdgeInsets.only(top: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: elevation,
            content: Padding(
              padding: contentPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ),
        ),
        if (showCloseButton)
          Positioned(
            top: top ?? Get.height * 0.20,
            right: Get.width * 0.1,
            child: GestureDetector(
              onTap: onClose ?? () => Get.back(),
              child: Container(
                decoration:BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

void showCustomDialog({
  required List<Widget> children,
  double? top,
  double? left,
  double? right,
  bool showCloseButton = true,
  VoidCallback? onClose,
  Color? backgroundColor,
  EdgeInsets? contentPadding,
  double? borderRadius,
  double? elevation,
  bool barrierDismissible = true,
}) {
  Get.dialog(
    CustomDialog(
      children: children,
      top: top,
      left: left,
      right: right,
      showCloseButton: showCloseButton,
      onClose: onClose,
      backgroundColor: backgroundColor,
      contentPadding: contentPadding ?? const EdgeInsets.all(16),
      borderRadius: borderRadius ?? 4,
      elevation: elevation ?? 10,
    ),
    barrierColor: const Color.fromARGB(72, 129, 129, 129).withOpacity(0.5),
    barrierDismissible: barrierDismissible,
  );
}