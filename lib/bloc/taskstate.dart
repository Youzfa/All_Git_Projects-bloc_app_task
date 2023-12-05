import 'package:bloc_app_task/models/task.dart';
import 'package:equatable/equatable.dart';

// bloc/taskstate.dart
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  const TaskLoaded(this.tasks);

  @override
  List<Object?> get props => [tasks];
}
