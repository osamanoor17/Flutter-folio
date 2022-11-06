import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moxi_portfolio/projects.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Soho'),
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/project': (context) => MyProject(),
      '/': (context) => MyHome(),
      '/about': (context) => MyApp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assets/moxi.jpg',
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.55),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Hello I am',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Muhammad Osama Noor',
                      style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 30)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                SizedBox(
                  child: TextButton(

                    onPressed: () async{
                      const url =
                          'https://muhammadosamanoor.ipzoneerp.com/';// or add your URL here
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text('Hire Me',style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),),
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                      backgroundColor: Colors.white, // Background Color
                    ),
                  ),
                  width: 120,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    IconButton(
                    onPressed: () async{
            const url =
            'https://www.instagram.com/me_izz_osama';// or add your URL here
            if (await canLaunch(url)) {
            await launch(url);
            } else {
            throw 'Could not launch $url';
            }
            },
                icon: const Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.purpleAccent,
                )),
      IconButton(
          onPressed: ()async {
            const url =
                'https://www.linkedin.com/in/muhammad-osama-noor-4185571a1?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BeWgzkIiMTnGZCPDVz2ITVQ%3D%3D';// or add your URL here
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          icon: const Icon(
            FontAwesomeIcons.linkedin,
            color: Colors.indigoAccent,
          )),
      IconButton(
          onPressed: () async {
            const url =
                'https://github.com/Meizzosama';// or add your URL here
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          icon: Icon(
            FontAwesomeIcons.github,
            color: Colors.white,
          )),
                      IconButton(
                          onPressed: () async {
                            const url =
                                'https://www.facebook.com/osama.don17';// or add your URL here
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blueAccent,
                          )),
                      IconButton(
                          onPressed: () async {
                            const url =
                                'https://twitter.com/me_izz_osama';// or add your URL here
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.lightBlue,
                          )),


                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),);
  }}
