import 'package:equatable/equatable.dart';

// models/task.dart
class Task extends Equatable {
  final int id;
  final String title;
  final bool isCompleted;

  const Task({required this.id, required this.title, this.isCompleted = false});

  @override
  List<Object?> get props => [id, title, isCompleted];

  Task copyWith({
    int? id,
    String? title,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
