import 'package:code_cluse_to_do_app/bloc/selectedIndexCubit/selected_index_cubit.dart';
import 'package:code_cluse_to_do_app/bloc/task_cubit/cubit/task_cubit.dart';
import 'package:code_cluse_to_do_app/core/components/list_card.dart';
import 'package:code_cluse_to_do_app/core/style/app_colors/app_colors.dart';
import 'package:code_cluse_to_do_app/core/style/app_text_style/app_text_style.dart';
import 'package:code_cluse_to_do_app/views/new_task_page.dart';
import 'package:code_cluse_to_do_app/views/single_task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/components/app_navigation_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.taskCubit}) : super(key: key);
  TaskCubit taskCubit;

  @override
  Widget build(BuildContext context) {
    //taskCubit = TaskCubit.get(context);
    //taskCubit.getTasks();
    return Scaffold(
        bottomNavigationBar: BlocConsumer<TaskCubit, TaskState>(
          listener: (context, state) {},
          builder: (context, state) {
            return AppNavigationBar(taskCubit);
          },
        ),
        body: BlocConsumer<TaskCubit, TaskState>(
          listener: (context, state) {},
          builder: (context, state) {
            return NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                          floating: true,
                          title: Text(
                            "To Do List",
                            style: AppTextStyle.appBarTextStyle(),
                          ),
                          centerTitle: true,
                          elevation: 0,
                          backgroundColor: Colors.white),
                    ],
                body: (taskCubit.tasks == null)
                    ? CircularProgressIndicator()
                    : (Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: taskCubit.tasks!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  print("hereee + ${taskCubit.tasks}");
                                  print(taskCubit.tasks!.length);
                                  if (!taskCubit.tasks![index].isDone!)
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleTaskPage(
                                                        index, taskCubit)),
                                            (route) => false);
                                      },
                                      child: ListCard(
                                        taskCubit: taskCubit,
                                        index: index,
                                      ),
                                    );
                                  else
                                    return Container();
                                },
                              ),
                            ),
                          ],
                        ),
                      )));
          },
        ));
  }
}
