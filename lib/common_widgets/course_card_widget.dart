import 'package:flutter/material.dart';
import 'package:language_learning_app/common_widgets/circular_percent_indicator.dart';
import 'package:language_learning_app/screens/course_page.dart';

class CourseCard extends StatelessWidget {
  final String language;
  final String level;
  final Color bgColor;
  final String percentage;
  final double progress;

  CourseCard(
      {this.progress,
      this.language,
      this.level,
      this.bgColor,
      this.percentage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoursePage(
              progress: progress,
              percentage: percentage,
            ),
          ),
        );
      },
      child: Container(
        height: 140,
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.4,
        margin: EdgeInsets.only(left: 20, right: 0),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                color: Colors.grey,
                offset: Offset(2, 4),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              language,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Text(
              level,
              style: TextStyle(
                fontFamily: 'Karla',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircularPercentIndicator(
                  progress: progress,
                  percentage: percentage,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
