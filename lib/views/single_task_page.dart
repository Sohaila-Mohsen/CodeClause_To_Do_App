import 'package:code_cluse_to_do_app/bloc/task_cubit/cubit/task_cubit.dart';
import 'package:code_cluse_to_do_app/core/style/app_text_style/app_text_style.dart';
import 'package:code_cluse_to_do_app/model/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/components/button.dart';
import '../core/components/form_field.dart';
import 'home_page.dart';

class SingleTaskPage extends StatelessWidget {
  SingleTaskPage(this.index, this.taskCubit, {Key? key}) : super(key: key) {
    _title = TextEditingController(text: "${taskCubit.tasks![index!].title}");
    _description =
        TextEditingController(text: "${taskCubit.tasks![index!].description}");
    _date = TextEditingController(text: "${taskCubit.tasks![index!].date}");
  }

  int? index;
  bool? enableEmail;
  TaskCubit taskCubit;

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController? _title;
  TextEditingController? _description;
  TextEditingController? _date;

  @override
  Widget build(BuildContext context) {
    double constraintsHight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 42,
              ),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      "Edit Task",
                      style: AppTextStyle.appBarTextStyle(),
                    )),
                    SizedBox(
                      height: constraintsHight / 20,
                    ),
                    SizedBox(
                      height: constraintsHight / 15,
                    ),
                    CustomFormField(
                      controller: _title,
                      label: "Title",
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'Title is required';
                        }
                      },
                    ),
                    CustomFormField(
                      controller: _description,
                      label: "Description",
                      validator: (value) {
                        if (value!.length < 1 || value == null) {
                          return 'Description is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomFormField(
                      enabled: false,
                      readOnly: true,
                      label: "Date",
                      controller: _title,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: constraintsHight / 30,
                    ),
                    AppButton(
                        onPress: () async {
                          await taskCubit.updateTask(Task(
                              title: _title!.text,
                              description: _description!.text,
                              date: taskCubit.tasks![index!].date,
                              taskId: taskCubit.tasks![index!].taskId));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        taskCubit: taskCubit,
                                      )));
                        },
                        text: "Update Task"),
                    SizedBox(
                      height: constraintsHight / 30,
                    ),
                    AppButton(
                        onPress: () async {
                          await taskCubit.deleteTask(Task(
                              title: _title!.text,
                              description: _description!.text,
                              date: taskCubit.tasks![index!].date,
                              taskId: taskCubit.tasks![index!].taskId));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        taskCubit: taskCubit,
                                      )));
                        },
                        text: "Delete Task"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
