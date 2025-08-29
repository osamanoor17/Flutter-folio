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
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 29, 134, 134),
                  Color.fromRGBO(241, 13, 13, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 29, 134, 134),
                Color.fromRGBO(241, 13, 13, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Card(
              color: const Color.fromARGB(255, 255, 255, 255),
              margin: const EdgeInsets.all(24),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Reach Out to me!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 10, 13, 211),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Ready to collaborate on exciting projects? Whether you have an idea or just want to connect, I'm always open to new opportunities and conversations!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromARGB(179, 0, 0, 0), fontSize: 16),
                    ),
                    const SizedBox(height: 18),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 18,
                      children: socials.map((social) {
                        return IconButton(
                          icon: Icon(social['icon'], color: social['color'], size: 32),
                          onPressed: () async {
                            await _launchUrl(social['url']);
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Software Engineer | Mobile Applications with Flutter | AI, Backend Systems, and Data Visualization',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    const Text('Karachi, Pakistan', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 14)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text('Open for opportunities: Yes', style: TextStyle(color: Color.fromARGB(255, 10, 10, 10), fontWeight: FontWeight.bold)),
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
                          const Icon(Icons.phone,  color: Color.fromARGB(255, 10, 13, 211),),
                          const SizedBox(width: 8),
                          Text(contactInfo['number'] ?? '', style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold)),
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
                          const Icon(Icons.email, color: Color.fromARGB(255, 10, 13, 211)),
                          const SizedBox(width: 8),
                          Text(contactInfo['email_address'] ?? '', style: const TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontWeight: FontWeight.bold)),
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