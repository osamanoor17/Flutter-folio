import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/about/about.dart';
import 'modules/education/education.dart';
import 'modules/splash/splash_screen.dart';
import 'modules/work_experience/work_experiences.dart';
import 'modules/achievements/achievements.dart';
import 'modules/blogs/blogs.dart';
import 'modules/contact/contact.dart';
import 'modules/projects/project.dart';
import 'modules/publications/publications.dart';
import 'modules/skills/skills.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(GetMaterialApp(
    theme: ThemeData(fontFamily: 'Soho'),
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(name: '/', page: () => const SplashScreen()),
      GetPage(name: '/about', page: () => const About()),
      GetPage(name: '/skills', page: () => const Skills()),
      GetPage(name: '/work_experiences', page: () => const WorkExperiences()),
      GetPage(name: '/education', page: () => const Education()),
      GetPage(name: '/projects', page: () => const Projects()),
      GetPage(name: '/achievements', page: () => const Achievements()),
      GetPage(name: '/blogs', page: () => const Blogs()),
      GetPage(name: '/publications', page: () => const Publications()),
      GetPage(name: '/contact', page: () =>  const Contact()),
    ],
  ));
}

