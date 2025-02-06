import 'package:flutter/material.dart';

import 'button_widget.dart';
import 'title_and_close.dart';

void showActionDialog({
  required BuildContext context,
  required Function onDelete,
  required Function onModify,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        // insetPadding: const EdgeInsets.symmetric(horizontal: 60),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ).copyWith(top: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: const Color(0xFF121212),
        children: [
          titleAndClose("Modification", context),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "What modification do you want to make to this task ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: customButton(
                  title: "Delete",
                  color: Colors.red,
                  onTap: () => onDelete(),
                ),
              ),
              Expanded(
                child: customButton(
                  title: "Modify",
                  color: Colors.blue,
                  onTap: () => onModify(),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
