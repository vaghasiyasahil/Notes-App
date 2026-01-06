import 'package:notes_app/export.dart';

Widget shimmerList() {
  return Expanded(
    child: ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => shimmerCard(),
    ),
  );
}