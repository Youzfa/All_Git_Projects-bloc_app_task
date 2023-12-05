import 'package:bloc_app_task/models/task.dart';

// Et voici le modèle des événements TaskEvent :

// Événements BLoC
// bloc/taskevent.dart

abstract class TaskEvent {}

class AddTask extends TaskEvent {
  final Task task;
  AddTask(this.task);
}

class UpdateTask extends TaskEvent {
  final Task task;
  UpdateTask(this.task);
}

class RemoveTask extends TaskEvent {
  final int taskId;
  RemoveTask(this.taskId);
}
