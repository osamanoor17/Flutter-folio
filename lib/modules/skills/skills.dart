// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../data/skills_data.dart';
import '../../data/icon_map.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  Widget skillTimeline() {
    return Column(
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
                const SizedBox(height: 5),
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
            const SizedBox(width: 15),

            // Skill name with gradient background
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                    fontFamily: "Soho",
                    color: skillColor.withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
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
          const Text(
            'What I do',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Soho",
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Passionate developer building innovative solutions across tech stacks.',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Soho",
              color: Colors.black54,
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
        color: const Color(0xff252525),
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
              style: const TextStyle(
                  fontSize: 16, fontFamily: "Soho", color: Colors.white),
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
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Skills & Technologies'),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            // Gradient background
            Container(
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
            ),

            // Heading, subtitle, and skill lines
            Container(
              margin: const EdgeInsets.only(top: 70, left: 12),
              child: const Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "What I do",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Soho",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "PASSIONATE DEVELOPER CREATING INNOVATIVE SOLUTIONS ACROSS MULTIPLE TECH STACKS.",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Soho",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    "⚡ Build responsive web applications with React.js and cross-platform mobile apps with Flutter.",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "⚡ Develop AI-powered solutions and data analytics dashboards using Python, Flask, and machine learning tools.",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "⚡ Integration of cloud services like Firebase, AWS, and Google Cloud with expertise in databases like MongoDB.",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(
                  top: 310, left: 20, right: 20, bottom: 07),
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
                child: Column(
                  children: [
                    skillTimeline(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
