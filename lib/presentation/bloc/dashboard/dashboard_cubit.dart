import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sdip_superapp/domain/usecase/dashboard.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required DashboardUseCase dashboardUseCase}) : _dashboardUseCase = dashboardUseCase, super(InitialState());
  final DashboardUseCase _dashboardUseCase;

  Future getStudentsList() async {
    final result = await _dashboardUseCase.getStudentsList();
    // print(result);

    result.fold(
      (failure) async {
        emit(StudentsListFailedToBeRetrieved(failure));;
      },
      (response) async {
        emit(StudentsListRetrieved(response.data));
        // print(response.data);
        // return response.data;
      }
    );
  }
}
