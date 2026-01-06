import 'package:notes_app/export.dart';

class AddAndUpdateNotesController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  NoteModel? existingNote;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is NoteModel) {
      existingNote = Get.arguments as NoteModel;
      titleController.text = existingNote!.title;
      contentController.text = existingNote!.description;
    }
  }

  void onSave() {
    if (titleController.text.trim().isEmpty && contentController.text.trim().isEmpty) {
      Get.back();
      return;
    }
    // Logic to save/update note will be implemented here later
    Get.back();
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }
}
