import 'package:employee_app/configs/configs.dart';
import 'package:employee_app/router/routes.dart';
import 'package:employee_app/utils/initial_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, //// For iOS (dark icons)
      ),
    );
    Size getDesignSize(BuildContext context) {
      final mediaQuery = MediaQuery.of(context);
      return mediaQuery.orientation == Orientation.portrait
          ? const Size(360, 690) // Portrait design size
          : const Size(690, 360); // Landscape design size (swapped dimensions)
    }

    return ScreenUtilInit(
      designSize: getDesignSize(context),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Fyre',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white900,
            fontFamily: 'Inter',
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: AppColors.neutral,
            ),
          ),
          debugShowMaterialGrid: false,
          initialBinding: InitialBindings(),
          getPages: AppRoutes.pages,
          initialRoute: AppRoutes.splash,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return child!;
          },
        );
      },
    );
  }
}
