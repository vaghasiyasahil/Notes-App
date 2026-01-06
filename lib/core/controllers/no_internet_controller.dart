import 'package:notes_app/export.dart';

class NoInternetController extends GetxController {

  void retryConnection() async {
    final connectivityService = Get.find<ConnectivityService>();
    bool isConnected = await connectivityService.checkCurrentStatus();
    if (isConnected) {
      Get.offAllNamed(Routes.splashScreen);
    } else {
      appToast(
        content: "No internet connection. Please try again.",
        type: ToastificationType.error,
      );
    }
  }
}
