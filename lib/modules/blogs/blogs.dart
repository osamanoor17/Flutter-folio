// ignore_for_file: deprecated_member_use

import 'package:flutterfolio/data/blogs_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/app_imports.dart';

class Blogs extends StatelessWidget {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url.trim());
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  const Blogs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Blogs'),
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemCount: blogs.length,
          itemBuilder: (context, index) {
            final blog = blogs[index];
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () async {
                final url = blog['url'] ?? '';
                if (url.isNotEmpty) {
                  await _launchUrl(url);
                }
              },
              child: Card(
                color: Get.isDarkMode ? const Color.fromARGB(255, 49, 49, 49) : Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.only(bottom: 18),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              blog['title'] ?? '',
                              style: TextStyle(
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              blog['description'] ?? '',
                              style: TextStyle(
                                color: Get.isDarkMode ? Colors.white : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                             Padding(
                        padding: const EdgeInsets.only(right: 12, top: 2),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            FontAwesomeIcons.medium,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            size: 28,
                          ),
                        ),
                      ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
