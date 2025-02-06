import 'package:flutter/material.dart';

class NoBoerTextField extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? radius;
  final bool? isError;
  const NoBoerTextField({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.height,
    this.radius,
    this.isError,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 15),
      margin: margin ?? const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: height ?? 60,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(radius ?? 15),
        border: isError ?? false
            ? Border.all(
                width: 2,
                color: Colors.red.withOpacity(0.2),
              )
            : null,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
