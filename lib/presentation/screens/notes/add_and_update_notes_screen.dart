import 'package:notes_app/export.dart';

class AddAndUpdateNotesScreen extends StatelessWidget {
  AddAndUpdateNotesScreen({super.key});

  final controller = Get.put(AddAndUpdateNotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      appBar: AppBar(
        backgroundColor: AppColors.kSecondary,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.kDarkSlate, size: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
              onPressed: controller.onSave,
              child: Text(
                'Save',
                style: AppStyle.k18600DarkSlate.copyWith(color: AppColors.kPrimary),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              cursorColor: AppColors.kPrimary,
              controller: controller.titleController,
              style: AppStyle.k28BoldDarkSlate,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: AppStyle.k28BoldDarkSlate.copyWith(color: AppColors.kGray.withValues(alpha: 0.5)),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              cursorColor: AppColors.kPrimary,
              controller: controller.contentController,
              style: AppStyle.k16NormalGray.copyWith(color: AppColors.kDarkSlate),
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Start typing...',
                hintStyle: AppStyle.k16NormalGray,
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

