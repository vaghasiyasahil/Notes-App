import 'package:notes_app/export.dart';

Widget emptyNotes() {
  return Expanded(
    child: Center(
      child: Column(
        children: [
          Spacer(),
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kWhite,
              boxShadow: [
                BoxShadow(color: AppColors.kPrimary.withValues(alpha: 0.05), blurRadius: 10),
              ],
            ),
            child: Icon(Icons.description, size: 64, color: AppColors.kPrimary),
          ),
          const SizedBox(height: 10),
          Text(
            'No notes yet',
            style: AppStyle.k28BoldDarkSlate.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 6),
          Text(
            'Tap + to create your first note',
            textAlign: TextAlign.center,
            style: AppStyle.k14NormalGray,
          ),
          const SizedBox(height: 34),
          Spacer(),
        ],
      ),
    ),
  );
}
