import 'package:flutter/material.dart';

Widget customButton({
  required String title,
  required VoidCallback onTap,
  required Color color,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    width: double.infinity,
    height: 50,
    child: MaterialButton(
      color: color,
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textColor: Colors.white,
      child: Text(title),
    ),
  );
}
