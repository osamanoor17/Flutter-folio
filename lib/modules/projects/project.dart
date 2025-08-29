
// ignore_for_file: deprecated_member_use
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;
// ignore: library_prefixes
import 'package:moxi_portfolio/controller/github_controller.dart' as GithubController;
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

  // Use bigProjects from imported data file

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
          padding: const EdgeInsets.all(16),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
      final project = snapshot.data![index];
      final url = (project["homepageUrl"]?.toString().isNotEmpty ?? false)
        ? project["homepageUrl"]
        : project["url"];
            final stars = project["stargazers"]?['totalCount'] ?? 0;
            final forks = project["forkCount"] ?? 0;
            final lang = project["primaryLanguage"]?['name'] ?? '';
            final langColor = project["primaryLanguage"]?['color'] ?? '#00bcd4';
            return Container(
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
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                 onTap: () async {
  if (url != null && url.toString().isNotEmpty) {
    await _launchUrl(url);
  } else {
  }

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(FontAwesomeIcons.github,
                                color: Colors.white, size: 28),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(project["name"] ?? '',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const Icon(FontAwesomeIcons.star,
                                      color: Colors.amber, size: 16),
                                  const SizedBox(width: 4),
                                  Text('$stars',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  const SizedBox(width: 10),
                                  const Icon(FontAwesomeIcons.codeFork,
                                      color: Colors.lightBlueAccent, size: 16),
                                  const SizedBox(width: 4),
                                  Text('$forks',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(project["description"] ?? '',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 16)),
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
                                      Border.all(color: Colors.white, width: 2),
                                ),
                              ),
                            if (lang.isNotEmpty) const SizedBox(width: 6),
                            if (lang.isNotEmpty)
                              Text(lang,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
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
      return a["projectName"].toString().toLowerCase().compareTo(b["projectName"].toString().toLowerCase());
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
                color: const Color(0xff262628),
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
                                    style: const TextStyle(
                                        color: Colors.cyanAccent,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(p["year"],
                                    style:
                                        const TextStyle(color: Colors.white70)),
                                Text(p["status"],
                                    style: const TextStyle(
                                        color: Colors.greenAccent)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(p["projectDesc"],
                          style: const TextStyle(color: Colors.white)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: List.generate(
                          (p["technologies"] as List).length,
                          (i) => Chip(
                            label: Text(p["technologies"][i],
                                style: const TextStyle(color: Colors.white)),
                            backgroundColor: Colors.cyan,
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
                              if (link != null && link is String && link.isNotEmpty) {
                                await _launchUrl(link);
                              }
                            },
                            child: Text(p["footerLink"][i]["name"],
                                style:
                                    const TextStyle(color: Colors.cyanAccent)),
                          ),
                        ),
                      ),
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title:  const Text('Projects', style: TextStyle(color: Colors.black)),
          flexibleSpace: Container(   // ✅ AppBar mein gradient
            decoration:  const BoxDecoration(
              gradient: LinearGradient(
                colors: [  Color.fromARGB(255, 29, 134, 134),
                    Color.fromRGBO(241, 13, 13, 1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          bottom:  const TabBar(
            indicatorColor: Color.fromARGB(255, 255, 39, 24),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'GitHub Projects'),
              Tab(text: 'Big Projects'),
            ],
          ),
        ),
        body: Container(   // ✅ Body mein same gradient
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 29, 134, 134),
                Color.fromRGBO(241, 13, 13, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:  TabBarView(
            children: [
                githubProjectsTab(),
                  bigProjectsTab(),
            ],
          ),
        ),
      ),
    ),
  );
}

}