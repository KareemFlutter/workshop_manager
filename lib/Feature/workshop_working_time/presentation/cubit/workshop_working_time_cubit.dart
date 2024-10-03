import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'workshop_working_time_state.dart';

class WorkshopWorkingTimeCubit extends Cubit<WorkshopWorkingTimeState> {
  WorkshopWorkingTimeCubit() : super(WorkshopWorkingTimeInitial());
  List<String> days = [
    'السبت',
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة'
  ];
  List<bool> isDayActive = [
    true,
    true,
    true,
    true,
    true,
    true,
    false
  ]; // Initial states
  List<TimeOfDay> fromTimes = List.filled(
      7,
      const TimeOfDay(
        hour: 8,
        minute: 30,
      ));
  List<TimeOfDay> toTimes = List.filled(
    7,
    const TimeOfDay(hour: 17, minute: 0),
  );
  Future<void> selectTime(
      BuildContext context, int index, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? fromTimes[index] : toTimes[index],
    );
    if (picked != null) {
      if (isStartTime) {
        fromTimes[index] = picked;
      } else {
        toTimes[index] = picked;
      }
      emit(ChangeTimeValueState(picked));
    }
  }

  void changeValue(bool value, int index) {
    isDayActive[index] = value;
    emit(ChangeSwitchButtonValue());
  }
}
