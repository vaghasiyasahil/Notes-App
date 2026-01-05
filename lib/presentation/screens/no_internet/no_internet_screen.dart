import 'package:notes_app/export.dart';

class NoInternetScreen extends StatelessWidget {
  NoInternetScreen({super.key});

  final controller = Get.put(NoInternetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kSecondary,
        centerTitle: true,
        title: Text(
          'Offline',
          style: AppStyle.k18600DarkSlate,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    wifiIcon(),

                    const SizedBox(height: 24),

                    Text(
                      'No internet connection',
                      style: AppStyle.k20BoldDarkSlate,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Please check your connection and try again to access your latest notes.',
                      style: AppStyle.k14NormalGray,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: AppButton(text: "Retry", onPressed: () {
                        controller.retryConnection();
                      },),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
