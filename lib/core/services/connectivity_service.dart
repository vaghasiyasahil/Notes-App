import 'package:notes_app/export.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final RxBool isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _initConnectivity() async {
    try {
      final List<ConnectivityResult> results = await _connectivity.checkConnectivity();
      _updateConnectionStatus(results);
    } catch (e) {
      Get.log("Connectivity check error: $e");
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    if (results.isEmpty || results.contains(ConnectivityResult.none)) {
      isConnected.value = false;
      if (Get.currentRoute != Routes.noInternetScreen) {
        Get.toNamed(Routes.noInternetScreen);
      }
    } else {
      isConnected.value = true;
      if (Get.currentRoute == Routes.noInternetScreen) {
        Get.offAllNamed(Routes.splashScreen);
      }
    }
  }

  Future<bool> checkCurrentStatus() async {
    final List<ConnectivityResult> results = await _connectivity.checkConnectivity();
    return !results.contains(ConnectivityResult.none) && results.isNotEmpty;
  }
}
