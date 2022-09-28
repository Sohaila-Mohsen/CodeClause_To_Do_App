import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial()) {}
  static TaskCubit get(context) => BlocProvider.of(context);
  final tasksRef = FirebaseFirestore.instance.collection('tasks');
  List<Task>? tasks;
  getTasks() async {
    //final tasksRef = FirebaseFirestore.instance.collection('tasks');
    tasks = [];
    await tasksRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        print("object");
        print(element.data());
        print(element.reference.id);
        tasks!.add(Task.fromJson(
            element.data() as Map<String, dynamic>, element.reference.id));
      });
      print(tasks);
      emit(TasksFetchedSuccessfully());
    });
  }

  addTask(Task task) async {
    final json = task.toJson();
    await tasksRef.add(json).then((value) {
      print("TaskAddedSuccessfully");
      getTasks();
      emit(TaskAddedSuccessfully());
    });
  }

  updateTask(Task task) async {
    final docTask = tasksRef.doc(task.taskId);
    print("task id ${task.taskId}");
    final json = task.toJson();
    await docTask.update(json).then((value) {
      print("TaskUpdatedSuccessfully");
      getTasks();
      emit(TaskUpdatedSuccessfully());
    });
  }

  deleteTask(Task task) async {
    final docTask = tasksRef.doc(task.taskId);
    await docTask.delete().then((value) {
      print("TaskDeletedSuccessfully");
      getTasks();
      emit(TaskDeletedSuccessfully());
    });
  }

  markTaskDone(Task task) async {
    task.isDone = true;
    await updateTask(task);
   // emit(TaskCompletedSuccessfully());
  }
}
