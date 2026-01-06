// signup_screen.dart
import 'package:notes_app/export.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppLogo(),
                const SizedBox(height: 20),

                Text("Start Writing Today", style: AppStyle.k28BoldDarkSlate),
                const SizedBox(height: 8),
                const Text(
                  "Join to start capturing your thoughts",
                  style: TextStyle(color: AppColors.kGray),
                ),
                const SizedBox(height: 32),

                AppTextField(
                  label: "Email Address",
                  hint: "Enter your email",
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validators.validateEmail(value ?? ""),
                ),
                const SizedBox(height: 16),

                Obx(
                  () => AppTextField(
                    label: "Password",
                    hint: "Enter your password",
                    controller: controller.password,
                    isPassword: true,
                    obscureText: !controller.isPasswordShow.value,
                    validator: (value) =>
                        Validators.validatePassword(value ?? ""),
                    onSuffixIconClick: () {
                      controller.togglePassword();
                    },
                  ),
                ),
                const SizedBox(height: 16),

                Obx(
                  () => AppTextField(
                    label: "Confirm Password",
                    hint: "Re-enter your password",
                    controller: controller.confirmPassword,
                    isPassword: true,
                    obscureText: !controller.isConfirmPasswordShow.value,
                    validator: (value) => Validators.validateConfirmPassword(
                      controller.password.text,
                      value ?? "",
                    ),
                    onSuffixIconClick: () {
                      controller.toggleConfirmPassword();
                    },
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => AppButton(
                      text: "Create Account",
                      isLoading: controller.isLoading.value,
                      onPressed: controller.signUp,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          color: AppColors.kPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
