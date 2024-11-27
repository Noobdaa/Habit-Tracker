import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_am_cooked/components/Themes.dart'; // Ensure these colors are defined in your Themes.dart
import '../models/tasks.dart';

class TaskTile extends StatelessWidget {
  final Task? task;
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    // Safely get task properties
    final taskTitle = task?.title ?? "No Title";
    final taskStartTime = task?.startTime ?? "00:00";
    final taskEndTime = task?.endTime ?? "00:00";
    final taskNote = task?.note ?? "No notes available.";
    final taskCompletionStatus = task?.isCompleted == 1 ? "COMPLETED" : "PENDING";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.95, // Adjust the width here (90% of screen width)
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 120,  // Adjust the height as needed (Fixed height)
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(task?.color ?? 0),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey[200],
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "$taskStartTime - $taskEndTime",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 13, color: Colors.grey[100]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  taskNote,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 15, color: Colors.grey[100]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 60, // Adjust the divider height as needed
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              taskCompletionStatus,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return purpleclr;
      case 1:
        return pinkclr;
      case 2:
        return blueclr;
      default:
        return primaryclr;
    }
  }
}
