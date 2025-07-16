// Import Statements
import 'package:employee_app/models/user/user.dart';
import 'package:employee_app/router/routes.dart';
import 'package:employee_app/ui/widgets/button/app_button.dart';
import 'package:employee_app/ui/widgets/snackbar/app_scnackbar.dart';
import 'package:flutter/material.dart';
import 'package:employee_app/configs/configs.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

part 'login_con.dart';
part 'login_scr.dart';

class LoginBin extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginCon());
  }
}
