import 'package:flutterfolio/widgets/app_imports.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Map<String, dynamic>> socials = [
  {
    'icon': FontAwesomeIcons.github,
    'color': Get.isDarkMode ? Colors.white : Colors.black,
    'url': 'https://github.com/osamanoor17',
  },
  {
    'icon': FontAwesomeIcons.linkedin,
    'color': Colors.blue,
    'url': 'https://www.linkedin.com/in/mosamanoor/',
  },
  {
    'icon': FontAwesomeIcons.gitlab,
    'color': Colors.orange,
    'url': 'https://gitlab.com/m.osamanoor',
  },
  {
    'icon': FontAwesomeIcons.facebook,
    'color': Colors.blueAccent,
    'url': 'https://www.facebook.com/osama.don17',
  },
  {
    'icon': FontAwesomeIcons.medium,
    'color': Get.isDarkMode ? Colors.white : Colors.black,
    'url': 'https://medium.com/@m.osamanoor',
  },
  {
    'icon': FontAwesomeIcons.envelope,
    'color': Get.isDarkMode ? Colors.redAccent : Colors.redAccent,
    'url': 'mailto:mosamanoor17@gmail.com',
  },
];
