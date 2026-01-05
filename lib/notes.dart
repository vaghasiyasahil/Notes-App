
import 'export.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetMaterialApp(
        getPages: Pages().pages,
        initialRoute: Routes.splashScreen,
        theme: ThemeData(
          useMaterial3: true,
          splashColor: AppColors.kPrimary.withValues(alpha: 0.1),
          highlightColor: AppColors.kPrimary,
          hoverColor: AppColors.kPrimary,
          unselectedWidgetColor: AppColors.kPrimary,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimary),
          textSelectionTheme: const TextSelectionThemeData(selectionHandleColor: AppColors.kPrimary),
          textTheme: GoogleFonts.interTextTheme(),
        ),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: MediaQuery.of(context).textScaler.clamp(minScaleFactor: 0.8, maxScaleFactor: 1.6),
          ),
          child: child!,
        ),
      ),
    );
  }
}