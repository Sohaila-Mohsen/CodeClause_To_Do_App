import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_cluse_to_do_app/model/task.dart';
import 'package:code_cluse_to_do_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../bloc/task_cubit/cubit/task_cubit.dart';
import '../core/components/app_navigation_bar.dart';
import '../core/components/button.dart';
import '../core/components/form_field.dart';
import '../core/style/app_text_style/app_text_style.dart';

class NewTaskPage extends StatelessWidget {
  NewTaskPage({Key? key, required this.taskCubit}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _date = TextEditingController();
  TaskCubit taskCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          return AppNavigationBar(taskCubit);
        },
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(15),
        child: Form(
            child: Column(
          children: [
            Container(
                height: 120,
                margin: EdgeInsets.only(top: 30),
                child: Lottie.asset("assets/lottie/signup.json")),
            CustomFormField(
              controller: _title,
              label: "Title",
              validator: (value) {
                if (value!.length < 1 || value == null)
                  return 'Title is required';
              },
            ),
            CustomFormField(
              controller: _description,
              label: "Description",
              validator: (value) {
                if (value!.length < 1 || value == null)
                  return 'Description is required';
                else
                  return null;
              },
            ),
            AppButton(
                onPress: () async {
                  Task task = Task(
                      title: _title.text,
                      description: _description.text,
                      date: Timestamp.fromDate(DateTime.now()));
                  taskCubit.addTask(task);
                  _title.clear();
                  _description.clear();
                  _date.clear();
                },
                text: "Add Task"),
          ],
        )),
      )),
    );
  }
}
