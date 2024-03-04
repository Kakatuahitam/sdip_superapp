part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {}

class InitialState extends DashboardState {
  @override
  List<Object> get props => [];
}

class StudentsListRetrieved extends DashboardState {
  final dynamic studentsListData;

  StudentsListRetrieved(this.studentsListData);

  @override
  List<Object> get props => [studentsListData];
}

class StudentsListFailedToBeRetrieved extends DashboardState {
  final dynamic message;

  StudentsListFailedToBeRetrieved(this.message);

  @override
  List<Object> get props => [message];
}
