part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}
class TasksFetchedSuccessfully extends TaskState {}
class TaskAddedSuccessfully extends TaskState {}
class TaskUpdatedSuccessfully extends TaskState {}
class TaskDeletedSuccessfully extends TaskState {}
class TaskCompletedSuccessfully extends TaskState {}
