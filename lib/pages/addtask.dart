import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:i_am_cooked/components/Inputfield.dart';
import 'package:i_am_cooked/components/Themes.dart';
import 'package:i_am_cooked/components/button.dart';
import 'package:i_am_cooked/controller/task_controller.dart';
import 'package:i_am_cooked/pages/main_page.dart';
import 'package:intl/intl.dart';
import '../models/tasks.dart';

class AddTaskpg extends StatefulWidget {
  const AddTaskpg({super.key});

  @override
  State<AddTaskpg> createState() => _AddTaskpgState();
}

class _AddTaskpgState extends State<AddTaskpg> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay(hour: 22, minute: 0);

  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];

  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly"];

  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextField(
                  title: "Title",
                  hint: "Enter habit name",
                  controller: _titleController,
                ),
                MyTextField(
                  title: "Note",
                  hint: "Enter note",
                  controller: _noteController,
                ),
                MyTextField(
                  title: "Date",
                  hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                    icon: const Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.grey,
                    ),
                    onPressed: _getDateFromUser,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        title: "Start Time",
                        hint: _startTime.format(context),
                        widget: IconButton(
                          onPressed: () => _getTimeFromUser(isStartTime: true),
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyTextField(
                        title: "End Time",
                        hint: _endTime.format(context),
                        widget: IconButton(
                          onPressed: () => _getTimeFromUser(isStartTime: false),
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                MyTextField(
                  title: "Remind",
                  hint: "$_selectedRemind minutes early",
                  widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    style: subtitleStyle,
                    underline: Container(height: 0),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRemind = int.parse(newValue!);
                      });
                    },
                    items: remindList
                        .map<DropdownMenuItem<String>>(
                            (int value) => DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        ))
                        .toList(),
                  ),
                ),
                MyTextField(
                  title: "Repeat",
                  hint: _selectedRepeat,
                  widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    style: subtitleStyle,
                    underline: Container(height: 0),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRepeat = newValue!;
                      });
                    },
                    items: repeatList
                        .map<DropdownMenuItem<String>>(
                            (String? value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value!,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _colorPallet(),
                    _butt(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
      task: Task(
        note: _noteController.text,
        title: _titleController.text,
        date: _selectedDate,
        startTime: _startTime.format(context),
        endTime: _endTime.format(context),
        remind: _selectedRemind,
        repeat: _selectedRepeat,
        color: _selectedColor,
        isCompleted: 0,
      ),
    );
    print("Task added with ID: $value");
  }

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDb();
      Get.back();
    } else {
      Get.snackbar(
        "Required",
        "All fields are required!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white10,
        colorText: primaryclr,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
        ),
      );
    }
  }

  _colorPallet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color", style: titleStyle),
        const SizedBox(height: 4),
        Wrap(
          children: List<Widget>.generate(
            3,
                (int index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5, right: 8, bottom: 5),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? purpleclr
                      : index == 1
                      ? pinkclr
                      : blueclr,
                  child: _selectedColor == index
                      ? const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 16,
                  )
                      : Container(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _butt() {
    return GestureDetector(
      onTap: _validateData,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(3),
          width: 110,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: primaryclr,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              "Create",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(right: 57.0),
        child: Center(
          child: Text(
            'Add Habit',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Get.to(MainPage());
        },
        child: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.red,
          size: 24.0,
          weight: 900,
        ),
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = pickedTime;
        } else {
          _endTime = pickedTime;
        }
      });
    }
  }
}
