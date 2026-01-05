import 'package:notes_app/export.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      body: Stack(
        children: [
          Positioned(
            top: -120,
            left: -120,
            child: Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                color: AppColors.kPrimary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -120,
            right: -120,
            child: Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                color: AppColors.kPrimary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Column(
            children: [
              logoView(),
              footerLoader(controller: controller),
            ],
          ),
        ],
      ),
    );
  }
}