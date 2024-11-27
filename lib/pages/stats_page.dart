import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'HabTrack',
            style: GoogleFonts.poppins(
              fontSize: 24,
              // color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Completion Rate',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.normal,

              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: _getPieChartSections(),
                  centerSpaceRadius: 40,
                  sectionsSpace: 2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Summary',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildSummaryCard(
              title: 'Completed Habits',
              value: '15',
              color: Colors.green,
            ),
            _buildSummaryCard(
              title: 'Active Habits',
              value: '5',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _getPieChartSections() {
    return [
      PieChartSectionData(
        value: 75,
        title: '75%',
        color: Colors.green,
        radius: 35,
        titleStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        value: 25,
        title: '25%',
        color: Colors.red,
        radius: 35,
        titleStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// class StatsPage extends StatefulWidget {
//   const StatsPage({super.key});
//
//   @override
//   State<StatsPage> createState() => _StatsPageState();
// }
//
// class _StatsPageState extends State<StatsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Container()
//     );
//   }
// }
