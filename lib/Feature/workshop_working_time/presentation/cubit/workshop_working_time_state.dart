part of 'workshop_working_time_cubit.dart';

sealed class WorkshopWorkingTimeState extends Equatable {
  const WorkshopWorkingTimeState();

  @override
  List<Object> get props => [];
}

final class WorkshopWorkingTimeInitial extends WorkshopWorkingTimeState {}

final class ChangeTimeValueState extends WorkshopWorkingTimeState {
  final TimeOfDay? picked;

  const ChangeTimeValueState(this.picked);
  @override
  List<Object> get props => [picked.toString()];
}

final class ChangeSwitchButtonValue extends WorkshopWorkingTimeState {}
