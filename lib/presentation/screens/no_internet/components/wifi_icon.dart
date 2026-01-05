import 'package:notes_app/export.dart';

Widget wifiIcon() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.kPrimary.withValues(alpha: 0.1),
        ),
      ),
      Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.kWhite,
          border: Border.all(color: AppColors.kLightGray),
        ),
        child: const Icon(
          Icons.wifi_off,
          size: 48,
          color: AppColors.kPrimary,
        ),
      ),
    ],
  );
}