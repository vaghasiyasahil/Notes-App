import 'package:notes_app/export.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  final notes = <NoteModel>[
    NoteModel(
      title: 'Meeting Notes - Q3 Strategy',
      description:
      'Discussed the marketing budget allocation for the upcoming quarter. Discussed the marketing budget allocation for the upcoming quarter. Discussed the marketing budget allocation for the upcoming quarter. Discussed the marketing budget allocation for the upcoming quarter.',
      time: 'Updated 2 hrs ago',
    ),
    NoteModel(
      title: 'Grocery List',
      description:
      'Milk, eggs, bread, spinach, chicken breast, olive oil.',
      time: 'Updated yesterday',
    ),
    NoteModel(
      title: 'App Ideas 2024',
      description:
      'AI-powered recipe generator, plant identification app.',
      time: 'Oct 24, 2023',
    ),
    NoteModel(
      title: 'Travel Itinerary: Japan',
      description:
      'Flight JL005 at 10:00 AM, hotel at Shinjuku.',
      time: 'Sep 15, 2023',
    ),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNotes();
  }

  Future<void> getNotes() async {
    await Future.delayed(Duration(seconds: 1));
    isLoading.value=false;
  }

}
