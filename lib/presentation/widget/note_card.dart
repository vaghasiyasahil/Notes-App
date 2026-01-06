import 'package:notes_app/export.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  final HomeController controller;
  const NoteCard({super.key, required this.note, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.addAndUpdateNotesScreen, arguments: note),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.kDarkSlate.withValues(alpha: 0.05),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.k18600DarkSlate,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              note.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: AppColors.kNeutralGray),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(controller.formatDate(note.updatedAt), style: AppStyle.k12NormalGray),
            ),
          ],
        ),
      ),
    );
  }
}
