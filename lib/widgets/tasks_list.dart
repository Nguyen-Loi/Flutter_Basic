import 'package:flutter/material.dart';
import 'task_title.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/tasks_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              // isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallBack: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                print('object');
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
