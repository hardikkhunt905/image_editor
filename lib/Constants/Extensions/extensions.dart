import 'package:flutter/material.dart';

extension DateExt on DateTime {
//intl lib
  // String get dayFormat  => DateFormat('d/MMM/yy').format(this);
  // String get dateFormat => DateFormat('dd/MM/yy').format(this);
  // String get timeFormat => DateFormat('kk: ss  aa').format(this);


}

extension PadZero on TimeOfDay {
  TimeOfDay addPadZero() {
    dynamic hour = this.hour.toString().padLeft(2, '0');
    dynamic min =minute.toString().padLeft(2, '0');
    TimeOfDay timeOfDay= TimeOfDay(hour: int.parse(hour), minute: int.parse(min));
    return timeOfDay;
  }
}

extension TimeOfDayConverter on TimeOfDay {
  TimeOfDay to24hours() {
    dynamic hour = this.hour.toString().padLeft(2, '0');
    dynamic min =minute.toString().padLeft(2, '0');
    hour = int.parse(hour)+12;
    min = int.parse(min);
    if(hour == 24 && min > 0){
      hour = 00;
    }
    TimeOfDay timeOfDay= TimeOfDay(hour: hour, minute: min);
    return timeOfDay;
  }
}

extension EmptyString on String{
  String isEmptyNA() {
    String foo = isEmpty ? 'N/A' : this;
    return foo;
  }

  String toZeroString() {
    String foo = isEmpty ? '0' : this;
    return foo;
  }
}

extension CamelCase on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toCamelCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

extension DateTimeParcer on String {
  TimeOfDay toTimeFromDate() {
    DateTime dateTime = DateTime.parse(this);
    dynamic hours = dateTime.hour.toString().padLeft(2, '0');
    dynamic mins =dateTime.minute.toString().padLeft(2, '0');
    int hour = int.parse(hours);
    int min = int.parse(mins);
    TimeOfDay timeOfDay= TimeOfDay(hour: hour, minute: min);
    return timeOfDay;
  }
}

extension CreateDateOfTime on TimeOfDay {
  DateTime toDateFromTime() {
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(now.year,now.month,now.day,hour,minute);
    return dateTime;
  }
}