import 'package:dartz/dartz.dart';
import 'package:perfection_structure/core/base_network/use_case.dart';
import 'package:perfection_structure/features/courses_list/data/model/courses_response_model.dart';
import '../repository/courses_repo.dart';

class CoursesUseCase extends UseCase<List<CoursesResponseModel>, NoParams> {
  final CoursesRepository coursesRepository;

  CoursesUseCase(this.coursesRepository);
  @override
  Future<Either<dynamic, CoursesResponseModel>> call(params) async =>
      await coursesRepository.getCourses();
}
