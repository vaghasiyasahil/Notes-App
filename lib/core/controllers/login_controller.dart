import 'package:notes_app/export.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isPasswordShow = false.obs;
  final formKey = GlobalKey<FormState>();

  void login() {
    if(formKey.currentState?.validate()??false){

    }
  }

  void togglePassword(){
    isPasswordShow.value = !isPasswordShow.value;
  }

}