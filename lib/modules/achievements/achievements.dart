// ignore_for_file: deprecated_member_use
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/app_imports.dart';
import '../../data/achievements_data.dart';

class Achievements extends StatelessWidget {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url.trim());
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  const Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Achievements'),
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        ),
        body: Container(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              final achievement = achievements[index];
              return Card(
                color: Get.isDarkMode ? Colors.grey[850] : Colors.white,
                margin: const EdgeInsets.only(bottom: 18),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              achievement['image'],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(achievement['title'],
                                    style: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(achievement['subtitle'],
                                    style: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.white70
                                            : Colors.black87)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: List.generate(
                          (achievement['footerLink'] as List).length,
                          (i) => TextButton(
                            onPressed: () async {
                              final link = achievement['footerLink'][i]['url'];
                              if (link != null &&
                                  link is String &&
                                  link.isNotEmpty) {
                                await _launchUrl(link);
                              }
                            },
                            child: Text(achievement['footerLink'][i]['name'],
                                style: TextStyle(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
