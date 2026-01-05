import 'package:notes_app/export.dart';

Widget homeAppbar(){
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Notes',
          style: AppStyle.k28BoldDarkSlate,
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            showLogoutDialog();
          },
        ),
      ],
    ),
  );
}