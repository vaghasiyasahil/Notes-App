import 'dart:ui';

import 'package:notes_app/export.dart';

void showLogoutDialog() {
  showDialog(
    context: Get.context!,
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.6),
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Dialog(
          backgroundColor: AppColors.kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.logout,
                    color: AppColors.kPrimary,
                    size: 26,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  "Log Out?",
                  textAlign: TextAlign.center,
                  style: AppStyle.k20700DarkSlate.copyWith(
                    fontSize: 22,
                    height: 1.2
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Are you sure you want to log out of your account?",
                  textAlign: TextAlign.center,
                  style: AppStyle.k15NormalGray.copyWith(
                    height: 1.5
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: AppButton(backgroundColor: AppColors.kSecondary,text: "Cancel", textColor: AppColors.kPrimary,onPressed: () {
                          Get.back();
                        },),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: AppButton(backgroundColor: AppColors.kPrimary,text: "Logout", textColor: AppColors.kSecondary,onPressed: () {
                        },),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
