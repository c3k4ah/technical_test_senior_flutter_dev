import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/task/domain/entities/task_entity.dart';

import '../manager/task_bloc.dart';
import 'action_dialog.dart';
import 'task_creation_bottom_sheets.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskEntity task;
  const TaskItemWidget({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showActionDialog(
          context: context,
          onDelete: () {
            context.read<TaskBloc>().add(DeleteTaskEvent(id: task.id));
            Navigator.pop(context);
          },
          onModify: () {
            showTaskCreationOrModification(
              task: task,
              context: context,
              onSubmit: (newTask) {
                if (task.id != 0) {
                  context
                      .read<TaskBloc>()
                      .add(ModifyOneTaskEvent(task: newTask));
                } else {
                  context.read<TaskBloc>().add(CreateTaskEvent(task: newTask));
                }
              },
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF121212),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SwitchListTile(
          title: Text(
            task.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          value: task.isCompleted ?? false,
          activeColor: Colors.green,
          inactiveThumbColor: Colors.grey.shade700,
          inactiveTrackColor: Colors.grey.shade300,
          onChanged: (value) {
            context.read<TaskBloc>().add(
                ModifyOneTaskEvent(task: task.copyWith(isCompleted: value)));
          },
        ),
      ),
    );
  }
}
