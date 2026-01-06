import 'package:notes_app/export.dart';

void appToast({required String content, required ToastificationType type}) {
  toastification.show(
    context: Get.context!,
    type: type,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(
      type == ToastificationType.success ? 'Success' : 'Error',
      style: TextStyle(color: type == ToastificationType.success ? AppColors.kGreen : AppColors.kRed),
    ),
    description: RichText(
      text: TextSpan(
        text: content,
        style: TextStyle(color: type == ToastificationType.success ? AppColors.kGreen : AppColors.kRed),
      ),
    ),
    alignment: Alignment.bottomCenter,
    showIcon: false,
  );
}