import 'package:notes_app/export.dart';

class AddAndUpdateNotesController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  RxBool isLoading = false.obs;
  NoteModel? existingNote;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is NoteModel) {
      existingNote = Get.arguments;
      titleController.text = existingNote?.title??"";
      contentController.text = existingNote?.content??"";
    }
  }

  Future<void> onSave() async {
    final title = titleController.text.trim();
    final content = contentController.text.trim();
    if (title.isEmpty && content.isEmpty) {
      Get.back();
      return;
    }
    isLoading.value = true;
    try {
      final now = DateTime.now();
      final userId = FirebaseAuthService.auth.currentUser?.uid ?? '';

      if (existingNote == null) {
        final newNote = NoteModel(
          id: '',
          title: title,
          content: content,
          createdAt: now,
          updatedAt: now,
          userId: userId,
        );
        await FirestoreService.addNote(newNote);
      } else {
        final updatedNote = existingNote!.copyWith(
          title: title,
          content: content,
          updatedAt: now,
        );
        await FirestoreService.updateNote(updatedNote);
      }
      Get.back();
    } catch (e) {
      Get.log("Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }
}
