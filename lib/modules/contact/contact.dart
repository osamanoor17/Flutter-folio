import 'package:url_launcher/url_launcher.dart';

import '../../widgets/app_imports.dart';
import '../../data/contact_data.dart';
import '../../data/socials_data.dart';

class Contact extends StatelessWidget {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url.trim());
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contact'),
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        ),
        body: Container(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          child: Center(
            child: Card(
              color: Get.isDarkMode
                  ? const Color.fromARGB(255, 49, 49, 49)
                  : Colors.white,
              margin: const EdgeInsets.all(24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Reach Out to me!',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Ready to collaborate on exciting projects? Whether you have an idea or just want to connect, I'm always open to new opportunities and conversations!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color:
                              Get.isDarkMode ? Colors.white70 : Colors.black54,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 18),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 18,
                      children: socials.map((social) {
                        return IconButton(
                          icon: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                               color: Get.isDarkMode ? Colors.white70 : Colors.black12,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(social['icon'],
                                color: social['color'], size: 32),
                          ),
                          onPressed: () async {
                            await _launchUrl(social['url']);
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Software Engineer | Mobile Applications with Flutter | AI, Backend Systems, and Data Visualization',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                         color:
                              Get.isDarkMode ? Colors.white70 : Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Text('Karachi, Pakistan',
                        style: TextStyle(
                           color:
                              Get.isDarkMode ? Colors.white70 : Colors.black54, fontSize: 14)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text('Open for opportunities: Yes',
                              style: TextStyle(
                                 color:
                              Get.isDarkMode ? Colors.white70 : Colors.black54,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        final phone = contactInfo['number'] ?? '';
                        if (phone.isNotEmpty) {
                          await _launchUrl('tel:$phone');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                           color:
                              Get.isDarkMode ? Colors.white70 : Colors.black54,
                          ),
                          const SizedBox(width: 8),
                          Text(contactInfo['number'] ?? '',
                              style: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.white70
                                      : Colors.black54,
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        final email = contactInfo['email_address'] ?? '';
                        if (email.isNotEmpty) {
                          await _launchUrl('mailto:$email');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email,
                              color: Get.isDarkMode
                                  ? Colors.white70
                                  : Colors.black54),
                          const SizedBox(width: 8),
                          Text(contactInfo['email_address'] ?? '',
                              style: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.white70
                                      : Colors.black54,
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
