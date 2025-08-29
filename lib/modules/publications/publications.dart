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
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: publications.length,
            itemBuilder: (context, index) {
              final pub = publications[index];
              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () async {
                  final url = pub['url'] ?? '';
                  if (url.isNotEmpty) {
                    await _launchUrl(url);
                  } else {
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xff0d47a1), Color(0xffe53935)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pub['title'] ?? '', style: const TextStyle(color: Colors.cyanAccent, fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(pub['description'] ?? '', style: const TextStyle(color: Colors.white)),
                        const SizedBox(height: 8),
                        Text('Publisher: ${pub['publisher'] ?? ''}', style: const TextStyle(color: Colors.white70)),
                        Text('Date: ${pub['date'] ?? ''}', style: const TextStyle(color: Colors.white70)),
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