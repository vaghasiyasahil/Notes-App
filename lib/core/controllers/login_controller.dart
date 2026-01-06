import 'package:notes_app/export.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isPasswordShow = false.obs;
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  Future<void> login() async {
    if (formKey.currentState!.validate() && !isLoading.value) {
      isLoading.value = true;
      try {
        await FirebaseAuthService.loginWithEmail(
          email: email.text.trim(),
          password: password.text.trim(),
        );
        appToast(
          content: "You’re in! Let’s continue",
          type: ToastificationType.success,
        );
        Get.offAllNamed(Routes.homeScreen);
      } catch (e) {
        Get.log("Error = $e");
      } finally {
        isLoading.value = false;
      }
    }
  }

  void togglePassword() {
    isPasswordShow.value = !isPasswordShow.value;
  }
}
