import 'package:notes_app/export.dart';

class Pages {
  List<GetPage<dynamic>> pages = [
    GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
    GetPage(name: Routes.loginScreen, page: () => LoginScreen()),
    GetPage(name: Routes.signUpScreen, page: () => SignUpScreen()),
    GetPage(name: Routes.homeScreen, page: () => HomeScreen()),
    GetPage(name: Routes.noInternetScreen, page: () => NoInternetScreen()),
  ];
}