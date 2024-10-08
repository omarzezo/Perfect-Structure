import 'package:perfection_structure/core/base_network/api_endpoints_constants.dart';
import 'package:perfection_structure/core/base_network/error/failures.dart';
import 'package:perfection_structure/core/base_network/network_repository.dart';
import 'package:perfection_structure/core/network_layer/new_network/api_result.dart';
import 'package:perfection_structure/core/network_layer/new_network/error_handler.dart';
import 'package:perfection_structure/features/courses_list/data/model/courses_response_model.dart';
import '../../domain/repository/courses_repo.dart';
import 'package:dartz/dartz.dart';

class CoursesRepositoryImp extends MainRepository implements CoursesRepository {
  CoursesRepositoryImp({
    required super.remoteData,
    required super.localData,
    required super.networkInfo,
  });

  @override
  Future<Either<dynamic, CoursesResponseModel>> getCourses() async {
    // final isConnected = await networkInfo.isConnected;
    // if (isConnected) {
      final result = await addData(
        getData: () => remoteData.get(
          path:ApiEndpointsConstants.studentCourses,
          headers: headers,
          model: CoursesResponseModel(),
        ),
        needCash: false,
      );
      return result.fold((l) => Left(l), (m) => Right((m)));
    // } else {
    //
    //   return Left(ErrorHandler.noNetworkExist());
    // }
  }
}
