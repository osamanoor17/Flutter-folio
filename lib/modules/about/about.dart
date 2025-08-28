import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildSocialIcon(IconData icon, Color color, String url) {
    return IconButton(
      onPressed: () => _launchUrl(url),
      icon: Icon(icon, color: color, size: 28),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(
          child: Container(
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
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 70,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/moxi.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Muhammad Osama Noor',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Full-Stack Developer | AI Enthusiast',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.code, color: Colors.white),
                  title: const Text('Skills',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed('/skills');
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.business_center, color: Colors.white),
                  title: const Text('Work Experiences',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed('/work_experiences');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.school, color: Colors.white),
                  title: const Text('Education',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed('/education');
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.folder_special, color: Colors.white),
                  title: const Text('Projects',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed('/projects');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.emoji_events, color: Colors.white),
                  title: const Text('Achievements',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed('/achievements');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit_note, color: Colors.white),
                  title: const Text('Blogs',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed('/blogs');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.menu_book, color: Colors.white),
                  title: const Text('Publications',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed('/publications');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_mail, color: Colors.white),
                  title: const Text('Contact Me',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed('/contact');
                  },
                ),
              ],
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 29, 134, 134),
                Color.fromRGBO(241, 13, 13, 1)
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Section
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 185,
                    height: 210,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/moxi.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  "Muhammad Osama Noor",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [Colors.cyanAccent, Colors.blueAccent],
                      ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Software Engineer | Flutter Apps |\n AI & Backend | Data Visualization",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 255, 255, 255),
                    letterSpacing: 1.1,
                  ),
                ),

                const SizedBox(height: 30),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () =>
                          _launchUrl("https://mosamanoor.netlify.app/"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 6,
                      ),
                      icon: const Icon(Icons.work, color: Colors.white),
                      label: const Text("Hire Me",
                          style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 15),
                    OutlinedButton.icon(
                      onPressed: () => _launchUrl(
                          "https://drive.google.com/drive/folders/1H0L33TCBRel1BVrSs02BVP4tqFfMbgmD"),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white70),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      icon:
                          const Icon(Icons.picture_as_pdf, color: Colors.white),
                      label: const Text("Resume",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // About Me Card
                Card(
                  color: Colors.white10,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "About Me",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyanAccent),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Full-Stack Developer specializing in AI-powered mobile & web applications 💻 Building innovative solutions with Flutter, React & Data Science 🤖 Let's create something amazing together! 🚀",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 245, 245, 245),
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Social Icons
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  children: [
                    _buildSocialIcon(FontAwesomeIcons.medium, Colors.black,
                        "https://medium.com/@m.osamanoor"),
                    _buildSocialIcon(
                        FontAwesomeIcons.linkedin,
                        Colors.blueAccent,
                        "https://www.linkedin.com/in/mosamanoor/"),
                    _buildSocialIcon(FontAwesomeIcons.github, Colors.black,
                        "https://github.com/osamanoor17"),
                    _buildSocialIcon(
                        FontAwesomeIcons.instagram,
                        Colors.pinkAccent,
                        "https://www.instagram.com/m.osamanoor/"),
                    _buildSocialIcon(FontAwesomeIcons.x, Colors.black,
                        "https://twitter.com/m_osamanoor"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
