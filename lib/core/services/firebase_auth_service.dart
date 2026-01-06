import 'package:notes_app/export.dart';

class FirebaseAuthService {
  static final auth = FirebaseAuth.instance;

  static User? currentUser(){
    return auth.currentUser;
  }

  static Future<UserCredential> loginWithEmail({required String email, required String password}) async {
    try {
      final user = await auth.signInWithEmailAndPassword(email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        appToast(content: "The password provided is too weak.", type: ToastificationType.error);
      } else if (e.code == 'email-already-in-use') {
        appToast(content: "The account already exists for that email.", type: ToastificationType.error);
      } else if (e.code == 'invalid-credential') {
        appToast(content: "Your email or password is wrong.", type: ToastificationType.error);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserCredential> signupWithEmail({required String email, required String password}) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        appToast(content: "The password provided is too weak.", type: ToastificationType.error);
      } else if (e.code == 'email-already-in-use') {
        appToast(content: "The account already exists for that email.", type: ToastificationType.error);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> logOut() async {
    await FirebaseAuthService.auth.signOut();
    Get.offAllNamed(Routes.loginScreen);
  }
}