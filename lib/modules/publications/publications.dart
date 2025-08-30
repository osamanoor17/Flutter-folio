// ignore_for_file: deprecated_member_use

import 'package:flutterfolio/data/publications_data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/app_imports.dart';

class Publications extends StatelessWidget {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url.trim());
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  const Publications({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Publications'),
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        ),
        body: Container(
          color: Get.isDarkMode ? Colors.black : Colors.white,
            child: ListView.builder(
              padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            itemCount: publications.length,
            itemBuilder: (context, index) {
              final pub = publications[index];
              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () async {
                  final url = pub['url'] ?? '';
                  if (url.isNotEmpty) {
                    await _launchUrl(url);
                  } else {}
                },
                child: Card(
                                  color: Get.isDarkMode ? const Color.fromARGB(255, 49, 49, 49) : Colors.white,

                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pub['title'] ?? '',
                            style: TextStyle(
                                color: Get.isDarkMode ?  Colors.white : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(pub['description'] ?? '',
                            style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
                        const SizedBox(height: 8),
                        Text('Publisher: ${pub['publisher'] ?? ''}',
                            style: TextStyle(color: Get.isDarkMode ? Colors.white70 : Colors.black54)),
                        Text('Date: ${pub['date'] ?? ''}',
                            style: TextStyle(color: Get.isDarkMode ? Colors.white70 : Colors.black54)),
                      ],
                    ),
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
