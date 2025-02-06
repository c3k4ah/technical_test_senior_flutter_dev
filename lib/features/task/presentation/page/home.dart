import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/task/presentation/manager/task_bloc.dart';

import '../../domain/entities/task_entity.dart';
import '../widgets/task_creation_bottom_sheets.dart';
import '../widgets/task_item_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "TODO",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.taskList == null || state.taskList!.isEmpty) {
            return RefreshIndicator(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .7,
                width: MediaQuery.sizeOf(context).width,
                child: ListView(
                  padding: const EdgeInsets.only(top: 50),
                  children: const [
                    Center(
                      child: Text(
                        "You have no pending tasks.",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onRefresh: () async {
                context.read<TaskBloc>().add(InitTaskDataEvent());
              },
            );
          }
          if (state.status == TaskStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          return SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .7,
                    width: MediaQuery.sizeOf(context).width,
                    child: ListView.builder(
                      itemCount: state.taskList!.length,
                      itemBuilder: (context, index) {
                        TaskEntity task = state.taskList![index];
                        return TaskItemWidget(task: task);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF121212),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showTaskCreationOrModification(
            context: context,
            onSubmit: (newTask) {
              context.read<TaskBloc>().add(CreateTaskEvent(task: newTask));
            },
          );
        },
      ),
    );
  }
}
