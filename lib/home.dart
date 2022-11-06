import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  aboutAchivements(num, type) {
    return Row(
      children: [
        Text(num,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Soho",
            )),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              type,
              style: const TextStyle(
                fontFamily: "Soho",
              ),
            ))
      ],
    );
  }

  mySpec(icon, text) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color(0xff252525),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 16, fontFamily: "Soho", color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      height: 115,
      width: 105,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: PopupMenuButton(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              icon: Icon(Icons.menu),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: TextButton(
                      child: Text(
                        'Projects',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/project');
                      }),
                  value: 1,
                ),
                PopupMenuItem(
                  child: TextButton(
                      child: Text(
                        'About Me',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/about');
                      }),
                  value: 2,
                )
              ]),
        ),
        body: SlidingSheet(
          elevation: 8,
          cornerRadius: 50,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.38, 0.7, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          body: Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 35),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
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
                      top: MediaQuery.of(context).size.height * 0.49),
                  child: Column(
                    children: const [
                      Text('Muhammad Osama Noor',
                          style: TextStyle(
                              fontFamily: "Soho",
                              color: Colors.amberAccent,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Flutter Developer',
                        style: TextStyle(
                            color: Colors.cyanAccent,
                            fontFamily: "Soho",
                            fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          builder: (context, state) {
            return Container(
              color: Colors.white,
              margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
              height: 500,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        aboutAchivements('50', ' Projects'),
                        aboutAchivements('60', ' Clients'),
                        aboutAchivements('90', ' Messages'),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Specialized In',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Soho",
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mySpec(FontAwesomeIcons.android, 'Android'),
                            mySpec(FontAwesomeIcons.aws, 'AWS'),
                            mySpec(FontAwesomeIcons.docker, 'Docker'),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mySpec(FontAwesomeIcons.github, 'GitHub'),
                            mySpec(FontAwesomeIcons.linux, 'Linux'),
                            mySpec(FontAwesomeIcons.wordpress, 'WordPress'),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mySpec(FontAwesomeIcons.appStoreIos, 'iOS'),
                            mySpec(FontAwesomeIcons.python, 'Python'),
                            mySpec(FontAwesomeIcons.unity, 'Game Dev'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
