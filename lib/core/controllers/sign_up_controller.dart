import 'package:notes_app/export.dart';
import 'package:notes_app/presentation/widget/app_toast.dart';

class SignUpController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isPasswordShow = false.obs;
  RxBool isConfirmPasswordShow = false.obs;

  void togglePassword() {
    isPasswordShow.value = !isPasswordShow.value;
  }

  void toggleConfirmPassword() {
    isConfirmPasswordShow.value = !isConfirmPasswordShow.value;
  }


  RxBool isLoading = false.obs;

  Future<void> signUp() async {
    if (formKey.currentState!.validate() && !isLoading.value) {
      isLoading.value = true;
      try {
        await FirebaseAuthService.signupWithEmail(
          email: email.text.trim(),
          password: password.text.trim(),
        );
        appToast(content: "You’re officially part of the app!", type: ToastificationType.success);
        Get.offAllNamed(Routes.homeScreen);
      } catch (e) {
        Get.log("Error = $e");
      } finally {
        isLoading.value = false;
      }
    }
  }
}
