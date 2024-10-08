import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:perfection_structure/core/network_layer/new_network/api_result.dart';

abstract class UseCase<Type, Params> {
  Future<Either<dynamic, dynamic>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}