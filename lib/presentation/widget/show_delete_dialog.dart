import 'dart:ui';
import 'package:notes_app/export.dart';

void showDeleteDialog({required VoidCallback onDelete}) {
  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    barrierColor: AppColors.kDarkSlate.withValues(alpha: 0.4),
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            width: 320,
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kDarkSlate.withValues(alpha: 0.2),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: AppColors.kRedLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.delete_outline,
                    color: AppColors.kRed,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Delete Note?",
                  style: AppStyle.k20700DarkSlate,
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Are you sure you want to delete this note? This action cannot be undone.",
                    textAlign: TextAlign.center,
                    style: AppStyle.k15NormalGray.copyWith(height: 1.4),
                  ),
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: AppButton(backgroundColor: AppColors.kRedLight,text: "Cancel", textColor: AppColors.kRed,onPressed: () {
                            Get.back();
                          },),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: AppButton(backgroundColor: AppColors.kRed,text: "Delete", textColor: AppColors.kRedLight,onPressed: () {
                            onDelete();
                          },),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    },
  );
}
