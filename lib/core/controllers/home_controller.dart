import 'package:notes_app/export.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  final notes = <NoteModel>[
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNotes();
  }

  Future<void> getNotes() async {
    await Future.delayed(Duration(seconds: 3));
    isLoading.value=false;
  }

}
