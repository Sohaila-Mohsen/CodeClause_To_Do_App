import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'done_task_state.dart';

class DoneTaskCubit extends Cubit<DoneTaskState> {
  DoneTaskCubit() : super(DoneTaskInitial());
  static DoneTaskCubit get(context) => BlocProvider.of(context);
  bool done = false;

  markAsDone() {
    done = true;
    emit(TaskMarkedDoneState());
  }
  markAsToDo() {
    done = false;
    emit(TaskMarkedToDoState());
  }
}
