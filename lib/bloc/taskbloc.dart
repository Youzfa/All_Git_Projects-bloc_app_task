import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app_task/models/task.dart';
import 'package:bloc_app_task/bloc/taskevent.dart';
import 'package:bloc_app_task/bloc/taskstate.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<Task> tasks = [];

  TaskBloc() : super(TaskInitial());

  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is AddTask) {
      tasks.add(event.task);
      yield TaskLoaded(tasks);
    } else if (event is UpdateTask) {
      final index = tasks.indexWhere((task) => task.id == event.task.id);
      tasks[index] = event.task;
      yield TaskLoaded(tasks);
    } else if (event is RemoveTask) {
      tasks.removeWhere((task) => task.id == event.taskId);
      yield TaskLoaded(tasks);
    }
  }
}
