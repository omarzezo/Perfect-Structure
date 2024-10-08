part of 'courses_list_bloc.dart';

abstract class CoursesListEvent extends Equatable {
  const CoursesListEvent();

  @override
  List<Object> get props => [];
}

class GetCoursesList extends CoursesListEvent {
  const GetCoursesList() : super();
}
class GetCoursesList2 extends CoursesListEvent {
  const GetCoursesList2() : super();
}
