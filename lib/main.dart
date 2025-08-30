import 'widgets/app_imports.dart';
import 'controllers/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Get.put(ThemeController());
  runApp(ScreenUtilInit(
    designSize: const Size(360, 690),
    minTextAdapt: true,
    builder: (context, child) => GetBuilder<ThemeController>(
      builder: (themeController) => GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        darkTheme: ThemeData(
          fontFamily: 'Montserrat',
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        themeMode: themeController.theme,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => const SplashScreen()),
          GetPage(name: '/about', page: () => const About()),
          GetPage(name: '/skills', page: () => const Skills()),
          GetPage(
              name: '/work_experiences', page: () => const WorkExperiences()),
          GetPage(name: '/education', page: () => const Education()),
          GetPage(name: '/projects', page: () => const Projects()),
          GetPage(name: '/achievements', page: () => const Achievements()),
          GetPage(name: '/blogs', page: () => const Blogs()),
          GetPage(name: '/publications', page: () => const Publications()),
          GetPage(name: '/contact', page: () => const Contact()),
        ],
      ),
    ),
  ));
}
