// Import Statements
import 'package:employee_app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:employee_app/configs/configs.dart';
import 'package:get/get.dart';

part 'splash_con.dart';
part 'splash_scr.dart';
part 'widgets/first_widget.dart';
part 'widgets/second_widget.dart';
part 'widgets/third_widget.dart';

class SplashBin extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashCon());
  }
}
