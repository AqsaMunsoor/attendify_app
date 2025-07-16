part of 'splash_bin.dart';

class SplashCon extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Start the timer when the controller is initialized
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {});

    Get.offAllNamed(AppRoutes.login);
  }
}
