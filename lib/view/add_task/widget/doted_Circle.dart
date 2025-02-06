import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedBorderWidget extends StatelessWidget {
  final bool isCompleted;
  final Color borderColor;
  final double size;
  final double iconSize;

  const DottedBorderWidget({
    Key? key,
    required this.isCompleted,
    this.borderColor = const Color.fromARGB(255, 0, 255, 30),
    this.size = 30.0,
    this.iconSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: borderColor,
      borderType: BorderType.Circle,
      radius: Radius.circular(size),
      padding: EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(size)),
        child: Container(
          width: size,
          height: size,
          color: isCompleted ? Colors.green : const Color.fromARGB(0, 255, 255, 255),
          child: isCompleted
              ? Icon(
                  Icons.check,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  size: iconSize,
                )
              : null,
        ),
      ),
    );
  }
}