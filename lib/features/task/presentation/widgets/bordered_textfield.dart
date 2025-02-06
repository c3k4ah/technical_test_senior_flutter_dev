import 'package:flutter/material.dart';

class BorderedTextField extends StatelessWidget {
  const BorderedTextField({
    super.key,
    required this.textField,
    this.color,
    this.height,
    this.radius,
    this.margin,
  });
  final TextField textField;
  final double? height;
  final double? radius;
  final EdgeInsets? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height ?? 60,
          // padding: const EdgeInsets.symmetric(
          //   horizontal: 20,
          // ),
          margin: margin ?? const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 20),
            border: Border.all(
              width: 2,
              color: color ?? Colors.white,
            ),
          ),
          child: Center(child: textField),
        ),
      ],
    );
  }
}
