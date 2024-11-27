import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_am_cooked/components/button.dart';
import 'package:i_am_cooked/controller/task_controller.dart';
import 'package:i_am_cooked/pages/addtask.dart';
import 'package:intl/intl.dart';
import 'package:i_am_cooked/models/tasks.dart';
import '../components/Themes.dart';
import '../components/task_tile.dart';
import '../db/db_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            _addTaskBar(),
            _datePicker(),
            SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children:[
                  Expanded(
                    child: Divider(
                      thickness: 0.8,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("Your Habits",
                    style: titleStyle,
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Divider(
                      thickness: 0.8,
                      color: Colors.grey[800],
                    ),
                  ),
                ]
              ),
            ),
            SizedBox(height: 10,),
            Expanded(child: _showTask()),
          ],
        ),
      ),
    );
  }

  Widget _datePicker() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), // Set border radius here
          color: Colors.black26, // Set background color if needed
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22), // Ensure the content also follows the rounded corner
          child: DatePicker(
            DateTime.now(),
            height: 80,
            width: 69,
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.red, // Customize the selection color
            selectedTextColor: Colors.white,
            dateTextStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            dayTextStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white54,
              ),
            ),
            monthTextStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white54,
              ),
            ),
            onDateChange: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
        ),
      ),
    );
  }

  // _showTask(){
  //   return Expanded(
  //       child: Obx((){
  //         return ListView.builder(
  //             itemCount: _taskController.taskList.length,
  //
  //             itemBuilder:(_, index){
  //               Task task = _taskController.taskList[index];
  //               // return AnimationConfiguration.staggeredList(
  //               //     position: index,
  //               //     child:SlideAnimation(
  //               //         child: FadeInAnimation(
  //               //             child: Row(
  //               //               children: [
  //               //                 GestureDetector(
  //               //                   onTap: (){
  //               //                     _showBottomSheet(context,_taskController.taskList[index]);
  //               //                   },
  //               //                   child: TaskTile(_taskController.taskList[index]),
  //               //                 )
  //               //               ],
  //               //             )
  //               //         )
  //               //     )
  //               // );
  //               // print(task.toJson());
  //               if(task.repeat=='Daily'){
  //                 return AnimationConfiguration.staggeredList(
  //                     position: index,
  //                     child:SlideAnimation(
  //                         child: FadeInAnimation(
  //                             child: Row(
  //                               children: [
  //                                 GestureDetector(
  //                                   onTap: (){
  //                                     _showBottomSheet(context,_taskController.taskList[index]);
  //                                   },
  //                                   child: TaskTile(_taskController.taskList[index]),
  //                                 )
  //                               ],
  //                             )
  //                         )
  //                     )
  //                 );
  //               }
  //               if(task.date==DateFormat.yMd().format(_selectedDate)){
  //                 return AnimationConfiguration.staggeredList(
  //                     position: index,
  //                     child:SlideAnimation(
  //                         child: FadeInAnimation(
  //                             child: Row(
  //                               children: [
  //                                 GestureDetector(
  //                                   onTap: (){
  //                                     _showBottomSheet(context,_taskController.taskList[index]);
  //                                   },
  //                                   child: TaskTile(_taskController.taskList[index]),
  //                                 )
  //                               ],
  //                             )
  //                         )
  //                     )
  //                 );
  //               }else{
  //                 return Container();
  //               }
  //
  //         });
  //       })
  //   );
  // }

  _showTask() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          itemCount: _taskController.taskList.length,
          itemBuilder: (_, index) {
            Task task = _taskController.taskList[index];
            print("Selected Date: $_selectedDate, Task Date: ${task.date}");
            print("Task is within 7 days: ${task.date!.isBefore(_selectedDate.add(Duration(days: 7)))} && ${task.date!.isAfter(_selectedDate.subtract(Duration(days: 7)))}");
            // Show daily tasks
            if (task.repeat == 'Daily') {
              return _buildTaskTile(index, task);
            }

            // Show tasks for the exact selected date
            if (task.date != null &&
                DateFormat.yMd().format(task.date!) ==
                    DateFormat.yMd().format(_selectedDate)) {
              return _buildTaskTile(index, task);
            }

            // Show tasks that repeat weekly (within the next 7 days)
            if (task.repeat == 'Weekly' &&
                task.date != null &&
                task.date!.isBefore(_selectedDate.add(Duration(days: 7))) &&
                task.date!.isAfter(_selectedDate.subtract(Duration(days: 7)))) {
              return _buildTaskTile(index, task);
            }

            // Return an empty container for tasks that don't match criteria
            return Container();
          },
        );
      }),
    );
  }

  Widget _buildTaskTile(int index, Task task) {
    return AnimationConfiguration.staggeredList(
      position: index,
      child: SlideAnimation(
        child: FadeInAnimation(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  _showBottomSheet(context, task);
                },
                child: TaskTile(task),
              ),
            ],
          ),
        ),
      ),
    );
  }






  _showBottomSheet(BuildContext context, Task task ){
 Get.bottomSheet(
   Container(
    padding: const EdgeInsets.only(top:4),
     height: task.isCompleted==1?
     MediaQuery.of(context).size.height*0.24:
     MediaQuery.of(context).size.height*0.32,
     color: Colors.black,
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 30.0),
       child: Column(
         children: [
           Container(
             height: 4,
             width: 120,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.black,
             ),
           ),
             const Spacer(),
           task.isCompleted==1
           ?Container()
               : _bottomSheetBtn(
             label: "Task Completed",
             onTap: (){
               _taskController.markTaskCompleted(task.id!);
               Get.back();
             },
             clr:primaryclr,
             context:context,
           ),
            SizedBox(
              height: 10,
            ),

           _bottomSheetBtn(
            label: "Delete Task",
             onTap: (){
              _taskController.delete(task);
              Get.back();
             },
            clr:Colors.white12,
             context:context,
            ),

           SizedBox(height: 30,),

           _bottomSheetBtn(
             label: "Close",
             onTap: (){
               Get.back();
             },
             clr:Colors.white12,
             isClose: true,
             context:context,
           ),
           SizedBox(height: 15,),
         ],
       ),
     ),
   )
 );
}

_bottomSheetBtn({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context
}){

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 45,
        width: MediaQuery.of(context).size.width*1.0,
        // color: isClose==true?Colors.black,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0,
            color: isClose==true?Colors.black12:clr,
          ),
          borderRadius: BorderRadius.circular(30),
          color: isClose==true?Colors.white12:clr,
          // color: isClose==true?Colors.transparent:clr,


          ),
        child: Center(
          child: Text(
              label,
            style: isClose?titleStyle:titleStyle.copyWith(color: Colors.white),
          ),
        ),
        ),
      );
}

  Widget _addTaskBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
      height: 95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Today",
                style: headingStyle
                ,
              ),
            ],
          ),
          buttons(
            onTap: () async {
              await Get.to(() => AddTaskpg());
              _taskController.getTask();
              // setState(() {
              //   // Refresh tasks after adding
              // });
            },
            label: "+",
          ),
        ],
      ),
    );
  }

  // Widget _showTasks() {
  //   String currentDate = DateTime.now().toIso8601String().split('T')[0]; // Current date in 'YYYY-MM-DD' format
  //
  //   return FutureBuilder<List<Map<String, dynamic>>>(
  //     future: _taskController.getTask(), // Fetch tasks asynchronously
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Center(child: CircularProgressIndicator());
  //       } else if (snapshot.hasError) {
  //         return Center(
  //           child: Text(
  //             'Error: ${snapshot.error}',
  //             style: const TextStyle(color: Colors.red),
  //           ),
  //         );
  //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //         return const Center(
  //           child: Text(
  //             'No tasks found!',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //         );
  //       } else {
  //         // Filter and sort tasks
  //         List<Map<String, dynamic>> tasks = snapshot.data!
  //             .where((task) => task['date'] == currentDate) // Filter by current date
  //             .toList();
  //
  //         tasks.sort((a, b) {
  //           // Sort by startTime
  //           TimeOfDay timeA = _parseTime(a['startTime']);
  //           TimeOfDay timeB = _parseTime(b['startTime']);
  //           return timeA.hour.compareTo(timeB.hour) == 0
  //               ? timeA.minute.compareTo(timeB.minute)
  //               : timeA.hour.compareTo(timeB.hour);
  //         });
  //
  //         if (tasks.isEmpty) {
  //           return const Center(
  //             child: Text(
  //               'No tasks for today!',
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             ),
  //           );
  //         }
  //
  //         return ListView.builder(
  //           itemCount: tasks.length,
  //           itemBuilder: (context, index) {
  //             Task task = Task.fromJson(tasks[index]);
  //             return GestureDetector(
  //               onLongPress: () async {
  //                 bool shouldDelete = await _showDeleteConfirmationDialog(context);
  //                 if (shouldDelete) {
  //                   await DBHelper.delete(task.id!); // Delete the task
  //                   setState(() {}); // Refresh the task list
  //                 }
  //               },
  //               child: TaskTile(task),
  //             );
  //           },
  //         );
  //       }
  //     },
  //   );
  // }





  _appBar() {
    return AppBar(
      // elevation: 1,
      // backgroundColor: Colors.black38, // Custom transparency
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'HabTrack',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      automaticallyImplyLeading: false,
    );

  }
}

// extension DateTimeWeek on DateTime {
//   int get weekOfYear {
//     final firstDayOfYear = DateTime(this.year, 1, 1);
//     final daysInYear = this.difference(firstDayOfYear).inDays;
//     return ((daysInYear / 7).floor()) + 1;
//   }
// }



// import 'package:date_picker_timeline/date_picker_timeline.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:i_am_cooked/components/button.dart';
// import 'package:i_am_cooked/controller/task_controller.dart';
// import 'package:i_am_cooked/pages/addtask.dart';
// import 'package:intl/intl.dart';
// import 'package:i_am_cooked/models/tasks.dart';
// import '../components/Themes.dart';
// import '../components/task_tile.dart';
//
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   DateTime _selectedDate = DateTime.now();
//   final TaskController _taskController = Get.put(TaskController());
//   var notifyHelper;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       // backgroundColor: Colors.black26,
//       appBar: _appBar(),
// //appDateBarr
//       body: Container(
//         height: 200,
//         child: Column(
//           children: [
//             //widgets at home not the nav bar
//             _addTaskBar(),
//             Container(
//               margin: const EdgeInsets.only(left: 10, right: 15),
//               height: 100,
//               // width: 80, // Optional: Set width if needed
//               decoration: BoxDecoration(
//                 color: Colors.white10, // Change this to your desired color
//                 borderRadius: BorderRadius.circular(10), // Optional: Adds rounded corners
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: Offset(0, 3), // Changes position of shadow
//                   ),
//                 ],
//               ),
//               child: DatePicker(
//                 DateTime.now(),
//                 height: 100,
//                 width: 75,
//                 initialSelectedDate: DateTime.now(),
//                 selectionColor: primaryclr,
//                 selectedTextColor: Colors.white,
//                 dateTextStyle: GoogleFonts.poppins(
//                   textStyle: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//                 dayTextStyle: GoogleFonts.poppins(
//                   textStyle: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white54,
//                   ),
//                 ),
//                 monthTextStyle: GoogleFonts.poppins(
//                   textStyle: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white54,
//                   ),
//                 ),
//                 onDateChange: (date){
//                   _selectedDate = date;
//                 },
//               ),
//             ),
//             _showTasks(),
//
//             // Container(
//             //   child: Text('Hiii'),
//             // )
//           ],
//         ),
//       ),
//
//     );
//   }
//  Widget _showTasks() {
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: _taskController.getTask(), // Fetch tasks asynchronously
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Show a loading spinner while waiting for data
//           return Text("loading...");
//         } else if (snapshot.hasError) {
//           // Handle errors gracefully
//           return Text('Error: ${snapshot.error}');
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           // Handle empty data case
//           return  Text('No tasks found!');
//         } else {
//           // Build the list of tasks
//           List<Map<String, dynamic>> tasks = snapshot.data!;
//           return Expanded(
//             child: ListView.builder(
//               itemCount: tasks.length,
//               itemBuilder: (context, index) {
//                 Task task = Task.fromJson(tasks[index]);
//                 return TaskTile(task);
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
//
//
// }
//
//
//
//
// Widget _addTaskBar(){
//   var _taskController;
//   return Container(
//     // backgroundColor: Colors.black26,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal:0.0 ,vertical: 0.0),
// //Heading
//       child: Container(
//         height: 100,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 0.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20,),
//                     //Date Format
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   DateFormat.yMMMMd().format(DateTime.now()), // Show full date
//                                   style: subHeadingStyle,
//                                 ),
//                                 Text("Today",
//                                   //DateFormat('EEEE').format(DateTime.now()), // Show day of the week
//                                   style: headingStyle,
//                                 ),
//
//                               ],
//                             ),
//                             GestureDetector(
//                               child: buttons(
//                                 onTap: () async {
//                                   await Get.to(AddTaskpg());
//                                   _taskController.getTask(); // Move this call here
//                                 },
//                                 label: "+",
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//
//     ),
//   );
// }
//
//
//
// _appBar(){
//   return AppBar(
//     // backgroundColor: Colors.black26,
//     title: Padding(
//       padding: const EdgeInsets.only(top: 8.0),
//       child: Text(
//         'Home',
//         style: GoogleFonts.poppins(
//           // color: Colors.red[900],
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//     automaticallyImplyLeading: false,
//   );
// }

