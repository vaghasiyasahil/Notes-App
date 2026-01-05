import 'package:notes_app/export.dart';

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


  void signUp() {
    if (formKey.currentState!.validate()) {
    }
  }
}
