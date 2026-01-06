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
    loaderValue.value = 0.30;
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    loaderValue.value += 0.40;
    WidgetsFlutterBinding.ensureInitialized();
    loaderValue.value += 0.60;
    await Firebase.initializeApp();
    loaderValue.value += 0.80;
    final connectivityService = Get.put(ConnectivityService(), permanent: true);
    loaderValue.value += 0.90;
    bool isConnected = await connectivityService.checkCurrentStatus();
    loaderValue.value += 0.100;
    if (!isConnected) {
      Get.offAllNamed(Routes.noInternetScreen);
      return;
    }

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
