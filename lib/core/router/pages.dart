import 'package:notes_app/export.dart';

class Pages {
  List<GetPage<dynamic>> pages = [
    GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
  ];
}