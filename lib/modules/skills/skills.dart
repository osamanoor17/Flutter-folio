// ignore_for_file: deprecated_member_use



import 'package:flutterfolio/data/icon_map.dart';
import 'package:flutterfolio/data/skills_data.dart';

import '../../widgets/app_imports.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  Widget skillTimeline() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: List.generate(skills.length, (index) {
        final skill = skills[index];
        final Color skillColor =
            skill["color"] is Color ? skill["color"] : Color(skill["color"]);
        final IconData skillIcon = skill["icon"] is IconData
            ? skill["icon"]
            : iconMap[skill["icon"]] ?? Icons.extension;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline dot
            Column(
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 20,
                  height: 25,
                  decoration: BoxDecoration(
                    color: skillColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: skillColor.withOpacity(0.3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Icon(skillIcon, color: Colors.white, size: 10),
                ),
                if (index != skills.length - 1)
                  Container(
                    width: 4,
                    height: 40,
                    color: skillColor.withOpacity(0.2),
                  ),
              ],
            ),
            const SizedBox(width: 20),

            // Skill name with gradient background
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      skillColor.withOpacity(0.3),
                      skillColor.withOpacity(0.08),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  skill["label"],
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
      ),
    );
  }

  Widget skillCard(Map<String, dynamic> skill) {
    return Container(
        decoration: BoxDecoration(
          color: skill["color"].withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(6),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'What I do',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Passionate developer building innovative solutions across tech stacks.',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Montserrat",
              color: Get.isDarkMode ? Colors.white70 : Colors.black54,
            ),
          ),
          const SizedBox(height: 30),
          // Only skills are scrollable
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: skillTimeline(),
            ),
          ),
        ]));
  }

  mySpec(icon, text) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 115,
      width: 105,
      child: Card(
        margin: const EdgeInsets.all(0),
              color: Get.isDarkMode ? const Color(0xff252525) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
        style: TextStyle(
          fontSize: 16, fontFamily: "Montserrat", color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        appBar: AppBar(
          title: Text('Skills & Technologies',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontFamily: "Montserrat",
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What I do",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "PASSIONATE DEVELOPER CREATING INNOVATIVE SOLUTIONS ACROSS MULTIPLE TECH STACKS.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Montserrat",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                "⚡ Build responsive web applications with React.js and cross-platform mobile apps with Flutter.",
                style: TextStyle(fontSize: 15, color: Get.isDarkMode ? Colors.white70 : Colors.black87),
              ),
              const SizedBox(height: 6),
              Text(
                "⚡ Develop AI-powered solutions and data analytics dashboards using Python, Flask, and machine learning tools.",
                style: TextStyle(fontSize: 15, color: Get.isDarkMode ? Colors.white70 : Colors.black87),
              ),
              const SizedBox(height: 6),
              Text(
                "⚡ Integration of cloud services like Firebase, AWS, and Google Cloud with expertise in databases like MongoDB.",
                style: TextStyle(fontSize: 15, color: Get.isDarkMode ? Colors.white70 : Colors.black87),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(0, 253, 253, 253).withOpacity(0.95),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: skillTimeline(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
