import 'package:employee_app/ui/screens/home/home_bin.dart';
import 'package:employee_app/ui/screens/login/login_bin.dart';
import 'package:employee_app/ui/screens/result/result_bin.dart';
import 'package:employee_app/ui/screens/splash/splash_bin.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String login = '/login_';
  static String home = '/home';
  static String result = '/result';
  static String splash = '/splash';

  static List<GetPage> pages = [
    GetPage(name: splash, page: () => const SplashScr(), binding: SplashBin()),
    GetPage(name: login, page: () => const LoginScr(), binding: LoginBin()),
    GetPage(
      name: AppRoutes.home,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
      page: () => const HomeScr(),
      bindings: [HomeBin()],
    ),
    GetPage(
      name: AppRoutes.result,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
      page: () => ResultScr(),
      bindings: [ResultBin()],
    ),
  ];
}
