import 'package:notes_app/export.dart';

class SplashController extends GetxController {
  RxDouble loaderValue = 0.0.obs;
  RxString appVersion = "v1.0.0".obs;

  @override
  void onInit() {
    super.onInit();
    animateLoader();
    getAppVersion();
  }

  Future<void> animateLoader() async {
    loaderValue.value = 0.0;
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    loaderValue.value += 0.10;
    WidgetsFlutterBinding.ensureInitialized();
    loaderValue.value += 0.20;
    await Firebase.initializeApp();
    loaderValue.value += 0.40;
    await Future.delayed(Duration(milliseconds: 500));
    loaderValue.value += 0.80;
    await Future.delayed(Duration(milliseconds: 500));
    loaderValue.value += 0.100;
    await Future.delayed(Duration(milliseconds: 500));
    Get.offNamed(
      FirebaseAuthService.currentUser() == null
          ? Routes.loginScreen
          : Routes.homeScreen,
    );
  }

  Future<void> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    appVersion.value = "v${info.version}";
  }
}
