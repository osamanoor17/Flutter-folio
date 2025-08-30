import 'package:flutterfolio/data/work_experiences_data.dart';

import '../../widgets/app_imports.dart';

class WorkExperiences extends StatelessWidget {
  const WorkExperiences({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Work Experiences'),
          backgroundColor: Colors.transparent,
          // elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        body: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 65),
              itemCount: workExperiences.length,
              itemBuilder: (context, index) {
                final exp = workExperiences[index];
                return Card(
                                 color: Get.isDarkMode ? const Color.fromARGB(255, 49, 49, 49) : Colors.white,

                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            exp["companylogo"],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exp["role"],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                exp["company"],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                exp["date"],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
