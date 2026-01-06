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
        onPressed: () => Get.toNamed(Routes.addAndUpdateNotesScreen),
        child: const Icon(Icons.add, size: 28, color: AppColors.kSecondary),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeAppbar(),
            searchView(controller),

            Obx(() {
              if (controller.isLoading.value) {
                return shimmerList();
              } else if (controller.filteredNotes.isEmpty) {
                return emptyNotes();
              } else {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: controller.filteredNotes.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: ValueKey(controller.filteredNotes[index].id),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (direction) async {
                            return await showDeleteDialog();
                          },
                          onDismissed: (direction) {
                            controller.deleteNote(controller.filteredNotes[index]);
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: AppColors.kRed,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(Icons.delete, color: AppColors.kWhite),
                          ),
                          child: NoteCard(
                            note: controller.filteredNotes[index],
                            controller: controller,
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
