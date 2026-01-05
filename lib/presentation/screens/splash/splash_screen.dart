import 'package:notes_app/export.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("data"),),
    );
  }
}
