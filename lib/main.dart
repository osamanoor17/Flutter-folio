import 'widgets/app_imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(ScreenUtilInit(
    designSize: const Size(360, 690),
    minTextAdapt: true,
    builder: (context, child) => GetMaterialApp(
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
    ),
  ));
}

