import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/app_imports.dart';
import '../../controllers/theme_controller.dart';

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
          iconTheme: IconThemeData(
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Get.isDarkMode ? Icons.nightlight_round : Icons.sunny,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                Get.find<ThemeController>().toggleTheme();
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 60,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/moxi.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Muhammad Osama Noor',
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Full-Stack Developer | AI Enthusiast',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white70 : Colors.black87,
                        fontSize: 14),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.code, color: Get.isDarkMode ? Colors.white : Colors.black),
                title: Text('Skills', style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed('/skills');
                },
              ),
              ListTile(
                leading: Icon(Icons.business_center, color: Get.isDarkMode ? Colors.white : Colors.black),
                title: Text('Work Experiences', style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed('/work_experiences');
                },
              ),
              ListTile(
                leading: Icon(Icons.school, color: Get.isDarkMode ? Colors.white : Colors.black),
                title: Text('Education', style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed('/education');
                },
              ),
              ListTile(
                leading: Icon(Icons.folder_special, color: Get.isDarkMode ? Colors.white : Colors.black),
                title: Text('Projects', style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed('/projects');
                },
              ),
              ListTile(
                leading: Icon(Icons.emoji_events, color: Get.isDarkMode ? Colors.white : Colors.black),
                title: Text('Achievements', style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed('/achievements');
                },
              ),
              ListTile(
                leading: Icon(Icons.edit_note, color: Get.isDarkMode ? Colors.white : Colors.black),
                title: Text('Blogs', style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed('/blogs');
                },
              ),
              ListTile(
                leading: Icon(Icons.menu_book, color: Get.isDarkMode ? Colors.white : Colors.black),
                title: Text('Publications', style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed('/publications');
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail, color: Get.isDarkMode ? Colors.white : Colors.black),
                title: Text('Contact Me', style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed('/contact');
                },
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          children: [
            // Profile Section
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 130,
                height: 150,
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
        
            Column(
              children: [
                Text(
                  "Muhammad Osama Noor",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Software Engineer | Flutter Apps |\n AI & Backend | Data Visualization",
                  style: TextStyle(
                    fontSize: 16,
                    color: Get.isDarkMode ? Colors.white70 : Colors.black87,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
        
            const SizedBox(height: 20),
        
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
        ElevatedButton.icon(
          onPressed: () =>
            _launchUrl("https://mosamanoor.netlify.app/"),
          style: ElevatedButton.styleFrom(
          backgroundColor: Get.isDarkMode ? Colors.blueGrey : Colors.blueAccent,
          padding: const EdgeInsets.symmetric(
            vertical: 12, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
          elevation: 6,
          ),
          icon: Icon(Icons.work, color: Get.isDarkMode ? Colors.white : Colors.white),
          label: Text("Hire Me",
            style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.white)),
        ),
        const SizedBox(width: 15),
        OutlinedButton.icon(
          onPressed: () => _launchUrl(
            "https://drive.google.com/drive/folders/1H0L33TCBRel1BVrSs02BVP4tqFfMbgmD"),
          style: OutlinedButton.styleFrom(
          side: BorderSide(color: Get.isDarkMode ? Colors.white70 : Colors.black54),
          padding: const EdgeInsets.symmetric(
            vertical: 12, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
          ),
          icon:
            Icon(Icons.picture_as_pdf, color: Get.isDarkMode ? Colors.white : Colors.black),
          label: Text("Resume",
            style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
        ),
              ],
            ),
        
            const SizedBox(height: 25),
        
            // About Me Card
            Card(
              color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "About Me",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode ? Colors.cyanAccent : Colors.blueAccent),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Full-Stack Developer specializing in AI-powered mobile & web applications 💻 Building innovative solutions with Flutter, React & Data Science 🤖 Let's create something amazing together! 🚀",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.white70 : Colors.black87,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
        
            const SizedBox(height: 25),
        
            // Social Icons
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              children: [
                _buildSocialIcon(
                  FontAwesomeIcons.medium,
                  Get.isDarkMode ? Colors.grey[400]! : Colors.black,
                  "https://medium.com/@m.osamanoor"
                ),
                _buildSocialIcon(
                  FontAwesomeIcons.linkedin,
                  Colors.blueAccent,
                  "https://www.linkedin.com/in/mosamanoor/"
                ),
                _buildSocialIcon(
                  FontAwesomeIcons.github,
                  Get.isDarkMode ? Colors.grey[400]! : Colors.black,
                  "https://github.com/osamanoor17"
                ),
                _buildSocialIcon(
                  FontAwesomeIcons.instagram,
                  Colors.pinkAccent,
                  "https://www.instagram.com/m.osamanoor/"
                ),
                _buildSocialIcon(
                  FontAwesomeIcons.x,
                  Get.isDarkMode ? Colors.grey[400]! : Colors.black,
                  "https://twitter.com/m_osamanoor"
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
