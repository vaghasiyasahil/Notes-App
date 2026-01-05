import 'package:notes_app/export.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? iconSize;
  const AppLogo({super.key,this.width,this.height, this.borderRadius, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??64,
      height: height??64,
      decoration: BoxDecoration(
        color: AppColors.kPrimary,
        borderRadius: BorderRadius.circular(borderRadius??12),
        boxShadow: [
          BoxShadow(
            color: AppColors.kPrimary.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Icon(
        Icons.edit_note,
        color: AppColors.kSecondary,
        size: iconSize??32,
      ),
    );
  }
}
