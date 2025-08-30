// ignore_for_file: deprecated_member_use
import 'package:flutterfolio/controllers/github_controller.dart'
    as GithubController;
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
// ignore: library_prefixes
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/app_imports.dart';
import '../../data/projects_data.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url.trim());
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  String selectedCategory = "All";

  final List<String> categories = [
    "All",
    "AI/ML",
    "Data Analytics",
    "Mobile Apps",
    "Web Apps",
    "Tools",
    "Games"
  ];

  Future<List<Map<String, dynamic>>> fetchGithubPinnedProjects() async {
    return await GithubController.fetchPinnedProjects();
  }

  Widget githubProjectsTab() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchGithubPinnedProjects(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
              child: Text('No pinned projects found.',
                  style: TextStyle(color: Colors.white)));
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final project = snapshot.data![index];
            final stars = project["stargazers"]?['totalCount'] ?? 0;
            final forks = project["forkCount"] ?? 0;
            final lang = project["primaryLanguage"]?['name'] ?? '';
            final langColor = project["primaryLanguage"]?['color'] ?? '#00bcd4';
            return Card(
              margin: const EdgeInsets.only(bottom: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
                             color: Get.isDarkMode ? const Color.fromARGB(255, 49, 49, 49) : Colors.white,

              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.github,
                            color: Get.isDarkMode ? Colors.white : Colors.black, size: 28),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(project["name"] ?? '',
                              style: TextStyle(
                                  color: Get.isDarkMode ? Colors.white : Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.star,
                                  color: Get.isDarkMode ? Colors.white : Colors.black, size: 16),
                              const SizedBox(width: 4),
                              Text('$stars',
                                  style:
                                      TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
                              const SizedBox(width: 10),
                              Icon(FontAwesomeIcons.codeFork,
                                  color: Get.isDarkMode ? Colors.white : Colors.black, size: 16),
                              const SizedBox(width: 4),
                              Text('$forks',
                                  style:
                                      TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(project["description"] ?? '',
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.white70 : Colors.black87, fontSize: 16)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        if (lang.isNotEmpty)
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Color(int.parse(
                                  langColor.replaceFirst('#', '0xff'))),
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Get.isDarkMode ? Colors.white : Colors.black, width: 2),
                            ),
                          ),
                        if (lang.isNotEmpty) const SizedBox(width: 6),
                        if (lang.isNotEmpty)
                          Text(lang,
                              style: TextStyle(
                                  color: Get.isDarkMode ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget bigProjectsTab() {
    List<Map<String, dynamic>> filteredProjects = selectedCategory == "All"
        ? List<Map<String, dynamic>>.from(bigProjects)
        : bigProjects.where((p) => p["category"] == selectedCategory).toList();

    filteredProjects.sort((a, b) {
      // Sort by year (latest first), then alphabetically
      int yearA = int.tryParse(a["year"].toString()) ?? 0;
      int yearB = int.tryParse(b["year"].toString()) ?? 0;
      if (yearA != yearB) {
        return yearB.compareTo(yearA); // latest first
      }
      return a["projectName"]
          .toString()
          .toLowerCase()
          .compareTo(b["projectName"].toString().toLowerCase());
    });
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ChoiceChip(
                  label: Text(cat, style: const TextStyle(color: Colors.white)),
                  selected: selectedCategory == cat,
                  selectedColor: Colors.cyan,
                  backgroundColor: Colors.grey[800],
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = cat;
                    });
                  },
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filteredProjects.length,
            itemBuilder: (context, index) {
              final p = filteredProjects[index];
              return Card(
                color: Get.isDarkMode ? const Color.fromARGB(255, 49, 49, 49) : Colors.white,
                margin: const EdgeInsets.only(bottom: 18),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              p["image"],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(p["projectName"],
                                    style: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(p["year"],
                                    style: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.white70
                                            : Colors.black87)),
                                Text(p["status"],
                                    style: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.greenAccent
                                            : Colors.green)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(p["projectDesc"],
                          style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          )),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: List.generate(
                          (p["technologies"] as List).length,
                          (i) => Chip(
                            label: Text(p["technologies"][i],
                                style: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.white,
                                )),
                            backgroundColor: Get.isDarkMode
                                ? Colors.greenAccent
                                : Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                          children: List.generate(
                        (p["footerLink"] as List).length,
                        (i) => TextButton(
                          onPressed: () async {
                            final link = p["footerLink"][i]["url"];
                            if (link != null &&
                                link is String &&
                                link.isNotEmpty) {
                              await _launchUrl(link);
                            }
                          },
                          child: Text(
                            p["footerLink"][i]["name"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Get.isDarkMode
                                    ? Colors.cyanAccent
                                    : Colors.blue),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          appBar: AppBar(
            elevation: 0,
            title: Text('Projects',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black)),
            bottom: TabBar(
              indicatorColor: const Color.fromARGB(255, 255, 39, 24),
              labelColor: Get.isDarkMode ? Colors.white : Colors.black,
              unselectedLabelColor:
                  Get.isDarkMode ? Colors.white : Colors.black,
              tabs: const [
                Tab(text: 'GitHub Projects'),
                Tab(text: 'Big Projects'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              githubProjectsTab(),
              bigProjectsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
