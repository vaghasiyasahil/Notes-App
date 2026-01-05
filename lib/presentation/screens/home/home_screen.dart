import 'package:notes_app/export.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kPrimary,
        onPressed: () {},
        child: const Icon(Icons.add, size: 28,color: AppColors.kSecondary,),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeAppbar(),
            searchView(),

            if(false)...[
              emptyNotes()
            ]else...[
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.notes.length,
                  itemBuilder: (context, index) {
                    final note = controller.notes[index];
                    return NoteCard(note: note);
                  },
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
