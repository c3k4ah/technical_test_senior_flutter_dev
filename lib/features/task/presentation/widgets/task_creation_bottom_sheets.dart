import 'package:flutter/material.dart';

import '../../domain/entities/task_entity.dart';
import 'bordered_textfield.dart';
import 'button_widget.dart';

void showTaskCreationOrModification({
  required BuildContext context,
  required Function(TaskEntity task) onSubmit,
  TaskEntity? task,
}) {
  TextEditingController titleController = TextEditingController();
  bool isCompleted = false;
  bool isTitleEmpty = false;

  if (task != null) {
    titleController.text = task.title ?? "";
    isCompleted = task.isCompleted ?? false;
  }
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    elevation: 10,
    isDismissible: false,
    builder: (context) => StatefulBuilder(
      builder: (cxt, setState) {
        return Container(
          height: MediaQuery.sizeOf(context).height * .6,
          width: MediaQuery.sizeOf(context).width,
          padding:
              const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 10),
          decoration: const BoxDecoration(
            color: Color(0xFF121212),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 5,
                width: 50,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white.withOpacity(.5),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                width: double.infinity,
                child: const Text(
                  "Title",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              BorderedTextField(
                radius: 15,
                color: isTitleEmpty ? Colors.red : Colors.white,
                textField: TextField(
                  controller: titleController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (v) {
                    setState(() {
                      isTitleEmpty = false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(.15),
                    ),
                  ),
                ),
              ),
              if (isTitleEmpty)
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "The title is required !",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                    ),
                  ),
                ),
              const Divider(
                color: Colors.white12,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                width: double.infinity,
                child: const Text(
                  "Status",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Is the task finished ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Switch(
                    value: isCompleted,
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.grey.shade700,
                    inactiveTrackColor: Colors.grey.shade300,
                    onChanged: (value) {
                      setState(() {
                        isCompleted = value;
                      });
                    },
                  )
                ],
              ),
              const Spacer(),
              customButton(
                color: (task == null) ? Colors.green : Colors.blue,
                title: (task == null) ? "Create" : "Save",
                onTap: () {
                  if (titleController.text.isNotEmpty) {
                    onSubmit(TaskEntity(
                      id: (task == null) ? 0 : task.id,
                      title: titleController.text,
                      isCompleted: isCompleted,
                      date: DateTime.now(),
                    ));
                    Navigator.pop(context);
                    if (task != null) {
                      Navigator.pop(context);
                    }
                  } else {
                    setState(() {
                      isTitleEmpty = true;
                    });
                  }
                },
              ),
              customButton(
                color: Colors.red,
                title: "Cancel",
                onTap: () {
                  Navigator.pop(context);
                  if (task != null) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    ),
  );
}
