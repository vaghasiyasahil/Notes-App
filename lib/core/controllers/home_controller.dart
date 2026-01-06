import 'dart:async';
import 'package:notes_app/export.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  final notes = <NoteModel>[].obs;
  RxString searchQuery = ''.obs;
  StreamSubscription? notesSubscription;

  List<NoteModel> get filteredNotes {
    if (searchQuery.value.isEmpty) {
      return notes;
    }
    return notes
        .where(
          (note) => note.title.toLowerCase().contains(
            searchQuery.value.toLowerCase(),
          ),
        )
        .toList();
  }

  void onSearch(String query) {
    searchQuery.value = query;
  }

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  void getNotes() {
    notesSubscription = FirestoreService.getNotesStream().listen(
      (noteList) {
        notes.assignAll(noteList);
        isLoading.value = false;
      },
      onError: (error) {
        Get.log("Error fetching notes: $error");
        isLoading.value = false;
      },
    );
  }

  String formatDate(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final day = date.day;
    final month = months[date.month - 1];
    final year = date.year;
    int hour = date.hour;
    final minute = date.minute.toString().padLeft(2, '0');
    final isPM = hour >= 12;
    hour = hour % 12;
    if (hour == 0) hour = 12;
    final period = isPM ? 'PM' : 'AM';
    return '$day $month $year at $hour:$minute $period';
  }

  Future<void> deleteNote(NoteModel note) async {
    try {
      final updatedNote = note.copyWith(isDelete: true);
      await FirestoreService.updateNote(updatedNote);
    } catch (e) {
      Get.log("Error deleting note: $e");
      appToast(
        content: "Something went wrong while deleting.",
        type: ToastificationType.error,
      );
    }
  }

  @override
  void onClose() {
    notesSubscription?.cancel();
    super.onClose();
  }
}
