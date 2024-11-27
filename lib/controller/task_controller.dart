// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_cooked/db/db_helper.dart';
import 'package:intl/intl.dart';
import '../models/tasks.dart';

class TaskController extends GetxController{
  @override
  void onReady(){
    getTask();
    super.onReady();
  }

  var taskList = <Task>[].obs;


  Future<int> addTask({Task? task}) async{
    return DBHelper.insert(task);
  }


//to get all data from table
  Future<List<Map<String, dynamic>>> getTask() async{
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data)=> Task.fromJson(data)).toList());
    return tasks;
  }

  void delete(Task task){
    DBHelper.delete(task);
    getTask();
  }

  void markTaskCompleted(int id)async{
    await DBHelper.update(id);
    getTask();
  }


}