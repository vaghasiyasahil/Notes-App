import 'package:notes_app/export.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppLogo(),
                  const SizedBox(height: 24),

                  Text("Hello Again!", style: AppStyle.k32BoldDarkSlate),
                  const SizedBox(height: 8),
                  Text(
                    "Please enter your details to access your notes.",
                    style: AppStyle.k16NormalGray,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  AppTextField(
                    label: "Email",
                    hint: "Enter your email",
                    controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validators.validateEmail(value ?? ""),
                  ),

                  const SizedBox(height: 10),
                  Obx(
                    () => AppTextField(
                      label: "Password",
                      hint: "Enter your password",
                      controller: controller.password,
                      obscureText: !controller.isPasswordShow.value,
                      isPassword: true,
                      onSuffixIconClick: () {
                        controller.togglePassword();
                      },
                      validator: (value) =>
                          Validators.validatePassword(value ?? ""),
                    ),
                  ),

                  const SizedBox(height: 26),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Obx(
                      () => AppButton(
                        text: "Log in",
                        isLoading: controller.isLoading.value,
                        onPressed: controller.login,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: AppColors.kGray, thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or",
                          style: AppStyle.k12NormalGray.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: AppColors.kGray, thickness: 1),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: AppColors.kGray),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.signUpScreen);
                        },
                        child: Text(
                          "Sign up",
                          style: AppStyle.k16500Gray.copyWith(
                            color: AppColors.kPrimary,
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
      ),
    );
  }
}
