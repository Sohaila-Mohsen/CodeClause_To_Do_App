import 'package:code_cluse_to_do_app/bloc/task_cubit/cubit/task_cubit.dart';
import 'package:code_cluse_to_do_app/views/done_page.dart';
import 'package:code_cluse_to_do_app/views/home_page.dart';
import 'package:code_cluse_to_do_app/views/new_task_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/selectedIndexCubit/selected_index_cubit.dart';
import '../style/app_colors/app_colors.dart';

class AppNavigationBar extends StatelessWidget {
  AppNavigationBar(this.taskCubit, {Key? key}) : super(key: key);
  TaskCubit? taskCubit;
  @override
  Widget build(BuildContext context) {
    List<Function> actions = [
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DonePage(
                    taskCubit: taskCubit!,
                  )),
        );
      },
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    taskCubit: taskCubit!,
                  )),
        );
      },
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewTaskPage(
                    taskCubit: taskCubit!,
                  )),
        );
      },
    ];
    SelectedIndexCubit selectedIndexCubit = SelectedIndexCubit.get(context);
    return BlocConsumer<SelectedIndexCubit, SelectedIndexState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CurvedNavigationBar(
          index: selectedIndexCubit.selectedIndex!,
          height: 60,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          buttonBackgroundColor: AppColors.primaryColorLight,
          color: const Color.fromARGB(167, 234, 233, 233),
          items: [
            Icon(
              Icons.done_outline_rounded,
              color: (selectedIndexCubit.selectedIndex == 0)
                  ? Colors.white
                  : Colors.black,
            ),
            Icon(
              Icons.home,
              color: (selectedIndexCubit.selectedIndex == 1)
                  ? Colors.white
                  : Colors.black,
            ),
            Icon(
              Icons.add,
              color: (selectedIndexCubit.selectedIndex == 2)
                  ? Colors.white
                  : Colors.black,
            ),
          ],
          onTap: (index) {
            selectedIndexCubit.changeIndex(index);
            actions[index]();
          },
        );
      },
    );
  }
}
