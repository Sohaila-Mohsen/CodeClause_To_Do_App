import 'package:code_cluse_to_do_app/bloc/task_cubit/cubit/task_cubit.dart';
import 'package:code_cluse_to_do_app/core/style/app_colors/app_colors.dart';
import 'package:code_cluse_to_do_app/core/style/app_text_style/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../model/task.dart';

class ListCard extends StatelessWidget {
  Task? task;
  TaskCubit? taskCubit;
  int? index;
  ListCard({Key? key, required this.taskCubit, required this.index})
      : super(key: key) {
    task = taskCubit!.tasks![index!];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task!.title!,
                  style: AppTextStyle.titleStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  task!.description!,
                  style: AppTextStyle.discriptionStyle(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${task!.date!.toDate().day} ${task!.date!.toDate().month}, ${task!.date!.toDate().year}",
                  style: AppTextStyle.greenTextStyle(),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              task!.isDone = !task!.isDone!;
              taskCubit!.updateTask(task!);
            },
            child: Container(
              height: 20,
              width: 20,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  border: (!task!.isDone!)
                      ? Border.all(color: AppColors.primaryColorLight, width: 2)
                      : Border()),
              child: (task!.isDone!)
                  ? Icon(
                      Icons.done,
                      color: AppColors.primaryColor,
                    )
                  : Container(),
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 192, 192, 192),
          ),
        ],
      ),
    );
  }
}
