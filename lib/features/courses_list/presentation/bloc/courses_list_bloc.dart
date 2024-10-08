import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfection_structure/core/base_network/use_case.dart';
import 'package:perfection_structure/features/courses_list/data/model/courses_response_model.dart';
import '../../domain/use_case/courses_use_case.dart';

part 'courses_list_event.dart';
part 'courses_list_state.dart';

class CoursesListBloc extends Bloc<CoursesListEvent, CoursesListState> {
  final CoursesUseCase coursesUseCase ;

  CoursesListBloc(this.coursesUseCase) : super(CoursesListInitial()) {
    on<CoursesListEvent>(_onCoursesFetched);
  }

  Future<void> _onCoursesFetched(CoursesListEvent event, Emitter<CoursesListState> emit) async {
    if (event is GetCoursesList) {
      emit(CoursesListLoading());
      final posts = await coursesUseCase.call(NoParams());
      posts.fold((l) => emit(CoursesListFail()), (r) => emit(CoursesListLoaded(r)));
    }
  }
}
