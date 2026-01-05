import 'package:notes_app/export.dart';

Widget logoView() {
  return Expanded(
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppLogo(width: 96, height: 96, borderRadius: 20, iconSize: 56),

          const SizedBox(height: 24),

          Text("Notes App", style: AppStyle.k32BoldDarkSlate),

          const SizedBox(height: 8),

          SizedBox(
            width: 200,
            child: Text(
              "Your thoughts, synced everywhere",
              textAlign: TextAlign.center,
              style: AppStyle.k14NormalGray,
            ),
          ),
        ],
      ),
    ),
  );
}
