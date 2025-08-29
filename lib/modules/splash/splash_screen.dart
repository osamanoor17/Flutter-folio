import 'dart:async';

import 'package:lottie/lottie.dart';

import '../../widgets/app_imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    Timer(const Duration(seconds: 3), () {
      Get.offAll(
        () => const About(),
        transition: Transition.fade,
        duration: const Duration(seconds: 2),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 29, 134, 134),
                Color.fromRGBO(241, 13, 13, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _controller,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Hey All  ',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        "assets/hand.png",
                        height: 40,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Lottie.asset(
                  'assets/codingPerson.json',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
