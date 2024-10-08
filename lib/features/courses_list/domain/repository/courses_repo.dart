import 'package:dartz/dartz.dart';
import 'package:perfection_structure/core/network_layer/new_network/api_result.dart';
import 'package:perfection_structure/features/courses_list/data/model/courses_response_model.dart';

// import '../entities/courses_response_model.dart';

abstract class  CoursesRepository {
  Future<Either<dynamic,CoursesResponseModel>> getCourses();
}


