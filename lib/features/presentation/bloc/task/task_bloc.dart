
import 'package:flutter_bloc/flutter_bloc.dart';

import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<TaskState> emit) async {
    emit(state.clone());
  }
}
