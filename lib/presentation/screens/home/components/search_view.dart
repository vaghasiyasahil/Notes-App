import 'package:notes_app/export.dart';

Widget searchView(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: TextField(
      cursorColor: AppColors.kPrimary,
      decoration: InputDecoration(
        hintText: 'Search by title...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: AppColors.kWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}