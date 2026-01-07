import 'package:notes_app/export.dart';

Widget dismissibleBackground() {
  return Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20),
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      color: AppColors.kRed,
      borderRadius: BorderRadius.circular(14),
    ),
    child: const Icon(
      Icons.delete,
      color: AppColors.kWhite,
    ),
  );
}