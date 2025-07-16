// Import Statements
import 'dart:io';
import 'dart:math';

import 'package:employee_app/models/payslip/payslip.dart';
import 'package:flutter/material.dart';
import 'package:employee_app/configs/configs.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

part 'result_con.dart';
part 'result_scr.dart';
part 'widgets/_details_card.dart';
part 'widgets/_detail_row.dart';
part 'widgets/_view.dart.dart';

class ResultBin extends Bindings {
  @override
  void dependencies() {
    final String imagePath = Get.arguments as String;

    Get.lazyPut(() => ResultCon(imagePath: imagePath));
  }
}
