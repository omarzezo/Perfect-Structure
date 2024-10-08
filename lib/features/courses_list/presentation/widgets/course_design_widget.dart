import 'package:flutter/material.dart';
import 'package:perfection_structure/features/courses_list/data/model/courses_response_model.dart';

class CourseDesignWidget extends StatelessWidget {
  final List<CoursesResponseModelDatum> courses;
  const CourseDesignWidget({super.key, required this.courses});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return VideoCard(course: courses[index]);
      },
    );
  }
}

class VideoCard extends StatelessWidget {
  final CoursesResponseModelDatum course;

  VideoCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image.network(AppApiUrl.BASE_URL + course.img!),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  course.idNation??'',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Category: ${course.slugNation}',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  'Viewers: ${course.year}',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  'Number of Videos: ${course.idYear.toString()}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
