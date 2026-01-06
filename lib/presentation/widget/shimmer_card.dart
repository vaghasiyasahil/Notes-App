import 'package:notes_app/export.dart';

Widget shimmerCard({
  double? height,
  double? width,
  double? borderRadius,
  Color? baseColor,
  Color? highlightColor,
}) {
  return Shimmer.fromColors(
    baseColor: baseColor??AppColors.kPrimary.withValues(alpha: 0.1),
    highlightColor: highlightColor??AppColors.kPrimary.withValues(alpha: 0.3),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius??12),
        color: AppColors.kSecondary,
      ),
      margin: EdgeInsets.only(bottom: 12),
      width: width??double.infinity,
      height: height??120,
    ),
  );
}
