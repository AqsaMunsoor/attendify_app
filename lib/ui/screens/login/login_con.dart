part of 'login_bin.dart';

enum LoginStatus { initial, loading, success, error }

class LoginCon extends GetxController {
  final status = LoginStatus.initial.obs;

  final formKey = GlobalKey<FormBuilderState>();

  bool get isLoading => status.value == LoginStatus.loading;

  final Map<String, dynamic> initialFormData = {
    'email': 'test@employee.com',
    'password': 'password123',
  };

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (formKey.currentState?.saveAndValidate() ?? false) {
      final formData = formKey.currentState!.value;
      final email = formData['email'] as String;
      final password = formData['password'] as String;

      try {
        status.value = LoginStatus.loading;
        final user = await _performMockLogin(email, password);
        status.value = LoginStatus.success;
        Get.offAllNamed(AppRoutes.home);
      } catch (e) {
        status.value = LoginStatus.error;
        CustomSnackbar.error(e.toString().replaceFirst('Exception: ', ''));

        await Future.delayed(const Duration(seconds: 2));
        if (status.value == LoginStatus.error) {
          status.value = LoginStatus.initial;
        }
      }
    } else {
      CustomSnackbar.error('Invalid input');
    }
  }

  Future<UserData> _performMockLogin(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (password.toLowerCase() == 'fail') {
      throw Exception('Invalid credentials provided.');
    }
    return UserData(
      uid: const Uuid().v4(),
      name: 'Mock Employee',
      email: email,
      employeeId: 'EMP${DateTime.now().millisecondsSinceEpoch % 10000}',
      role: Role.employee,
      profilePic:
          'https://api.dicebear.com/7.x/initials/svg?seed=${email.split('@').first}',
      createdAt: DateTime.now(),
    );
  }
}
