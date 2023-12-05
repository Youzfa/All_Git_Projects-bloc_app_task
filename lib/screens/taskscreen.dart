import 'package:bloc_app_task/bloc/taskevent.dart';
import 'package:bloc_app_task/bloc/taskstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app_task/bloc/taskbloc.dart';

// Screens/taskscreen.dart

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste des tâches')),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoaded) {
            final tasks = state.tasks;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      final updatedTask = task.copyWith(isCompleted: value);
                      context.read<TaskBloc>().add(UpdateTask(updatedTask));
                    },
                  ),
                  onLongPress: () {
                    context.read<TaskBloc>().add(RemoveTask(task.id));
                  },
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Affichez une boîte de dialogue pour ajouter une tâche
          // Créez une nouvelle tâche et envoyez l'événement AddTask au BLoC
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
