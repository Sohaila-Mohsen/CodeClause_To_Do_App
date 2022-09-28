import 'dart:async';

import 'package:code_cluse_to_do_app/bloc/task_cubit/cubit/task_cubit.dart';
import 'package:code_cluse_to_do_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/utils/sp_helper/cache_helper.dart';

class SplachScreen extends StatefulWidget {
  SplachScreen({Key? key}) : super(key: key);

  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  late TaskCubit taskCubit;
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    taskCubit = TaskCubit.get(context);
    taskCubit.getTasks();
    return Scaffold(
      body: Center(child: Lottie.asset("assets/lottie/signup.json")),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 10);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return HomePage(taskCubit: taskCubit);
    }), (route) => true);
  }
}
