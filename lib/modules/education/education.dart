
import '../../data/education_data.dart';
import '../../widgets/app_imports.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Education'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          children: [
            Card(
                color: Get.isDarkMode ? const Color.fromARGB(255, 49, 49, 49) : Colors.white,
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              margin: const EdgeInsets.only(bottom: 24),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            school["logo"] as String,
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
                                school["schoolName"] as String,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              
                              ),
                              const SizedBox(height: 6),
                              Text(
                                school["subHeader"] as String,
                                style:  TextStyle(
                                  fontSize: 16,
                                  color:Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                ),
                              
                              const SizedBox(height: 6),
                              Text(
                                school["duration"] as String,
                                style:  TextStyle(
                                  fontSize: 14,
                                  color:Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      school["desc"] as String,
                      style: TextStyle(
                        fontSize: 15,
                      color:Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(
                      (school["descBullets"] as List<String>).length,
                      (i) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("• ",
                              style: TextStyle(
                                 color:Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16)),
                          Expanded(
                            child: Text(
                              (school["descBullets"] as List<String>)[i],
                              style:  TextStyle(
                               color:Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
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
