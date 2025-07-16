import 'dart:io';
import 'dart:math';

import 'package:employee_app/configs/configs.dart';
import 'package:employee_app/models/attendance/attendance.dart';
import 'package:employee_app/router/routes.dart';
import 'package:employee_app/ui/widgets/snackbar/app_scnackbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:uuid/uuid.dart';

part 'home_con.dart';
part 'home_scr.dart';
part 'widgets/_filter_chips.dart';
part 'widgets/_attendance_list.dart';
part 'widgets/third_widget.dart';

class HomeBin extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeCon());
  }
}
