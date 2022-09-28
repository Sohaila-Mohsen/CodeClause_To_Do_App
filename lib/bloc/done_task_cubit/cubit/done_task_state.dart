part of 'done_task_cubit.dart';

@immutable
abstract class DoneTaskState {}

class DoneTaskInitial extends DoneTaskState {}
class TaskMarkedDoneState extends DoneTaskState {}
class TaskMarkedToDoState extends DoneTaskState {}
