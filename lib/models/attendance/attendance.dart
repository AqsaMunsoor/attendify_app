// lib/features/home/data/attendance_record_model.dart

import 'package:flutter/material.dart';

// A type-safe enum for the attendance status.
enum AttendanceStatus { all, present, absent, late }

// Extension to add helper properties to the enum for UI display.
extension AttendanceStatusX on AttendanceStatus {
  String get displayName {
    switch (this) {
      case AttendanceStatus.all:
        return 'All';
      case AttendanceStatus.present:
        return 'Present';
      case AttendanceStatus.absent:
        return 'Absent';
      case AttendanceStatus.late:
        return 'Late';
    }
  }

  Color get color {
    switch (this) {
      case AttendanceStatus.all:
        return Colors.blueGrey;
      case AttendanceStatus.present:
        return Colors.green;
      case AttendanceStatus.absent:
        return Colors.red;
      case AttendanceStatus.late:
        return Colors.orange;
    }
  }
}

// The data model for a single attendance record.
class AttendanceRecordModel {
  final String id;
  final DateTime date;
  final AttendanceStatus status;

  AttendanceRecordModel({
    required this.id,
    required this.date,
    required this.status,
  });
}
