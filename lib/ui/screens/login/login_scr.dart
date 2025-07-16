part of 'login_bin.dart';

class LoginScr extends StatelessWidget {
  const LoginScr({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginCon controller = Get.put(LoginCon());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: Space.p.all.t24,
          child: FormBuilder(
            key: controller.formKey,
            initialValue: controller.initialFormData,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Attendify',
                  style: AppText.h1.copyWith(
                    color: AppColors.neutral,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                Space.y.t32,
                Text(
                  'Login',
                  style: AppText.h2.copyWith(
                    color: AppColors.neutral,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
                Space.y.t32,
                Space.y.t32,
                //email
                FormBuilderTextField(
                  name: 'email',
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    hintStyle: AppText.bodyRegular.copyWith(
                      color: AppColors.neutral400,
                    ),
                    labelStyle: AppText.bodyMedium.copyWith(
                      color: AppColors.neutral600,
                    ),
                    filled: true,
                    fillColor: AppColors.white900,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.white300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.white300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.neutral,
                        width: 1.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.errorBorder,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.error,
                        width: 1.5,
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.email_outlined,
                      color: AppColors.neutral400,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(
                      errorText: 'Please enter a valid email',
                    ),
                  ]),
                ),
                Space.y.t16,
                //password
                FormBuilderTextField(
                  name: 'password',
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    hintStyle: AppText.bodyRegular.copyWith(
                      color: AppColors.neutral400,
                    ),
                    labelStyle: AppText.bodyMedium.copyWith(
                      color: AppColors.neutral600,
                    ),
                    filled: true,
                    fillColor: AppColors.white900,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.white300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.white300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.neutral,
                        width: 1.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.errorBorder,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.error,
                        width: 1.5,
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.neutral400,
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(
                      6,
                      errorText: 'Password must be at least 6 characters long',
                    ),
                  ]),
                ),
                Space.y.t32,
                AppButton(
                  label: 'Login',
                  isLoading:
                      () => controller.status.value == LoginStatus.loading,
                  onPressed: controller.login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
