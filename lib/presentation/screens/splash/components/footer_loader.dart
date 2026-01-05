import 'package:notes_app/export.dart';

Widget footerLoader({required SplashController controller}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 48),
    child: Column(
      children: [
        Text("Checking status...", style: AppStyle.k12NormalGray),
        const SizedBox(height: 8),

        SizedBox(
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Obx(
              () => LinearProgressIndicator(
                minHeight: 6,
                value: controller.loaderValue.value,
                backgroundColor: AppColors.kLightGray,
                valueColor: AlwaysStoppedAnimation(AppColors.kPrimary),
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        Obx(
          () =>
              Text(controller.appVersion.value, style: AppStyle.k12NormalGray),
        ),
      ],
    ),
  );
}
