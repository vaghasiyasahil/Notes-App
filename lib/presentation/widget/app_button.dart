import 'package:notes_app/export.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;
  final Widget? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.kPrimary,
    this.textColor = AppColors.kSecondary,
    this.height = 56,
    this.borderRadius = 12,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: AppStyle.k16500Gray.copyWith(color: textColor),
                  ),
                ],
              )
            : Text(text, style: AppStyle.k16500Gray.copyWith(color: textColor)),
      ),
    );
  }
}
