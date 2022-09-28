import 'package:code_cluse_to_do_app/views/new_task_page.dart';
import 'package:code_cluse_to_do_app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/done_task_cubit/cubit/done_task_cubit.dart';
import '../bloc/selectedIndexCubit/selected_index_cubit.dart';
import '../bloc/task_cubit/cubit/task_cubit.dart';
import '../views/home_page.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectedIndexCubit(),
        ),
        BlocProvider(
          create: (context) => DoneTaskCubit(),
        ),
        BlocProvider(
          create: (context) => TaskCubit(),
        ),
      ],
      child: MaterialApp(
        home: SplachScreen(),
      ),
    );
  }
}
