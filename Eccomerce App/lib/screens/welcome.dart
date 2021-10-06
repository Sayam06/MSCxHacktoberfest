import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:task_1_zairza/screens/2_A.dart';
import 'package:task_1_zairza/screens/2_B.dart';

import 'Signin.dart';

class Welcome extends StatefulWidget{
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}
class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds:4),
          () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Page2B())
        );
      },
    );
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            child: Container(
              alignment: Alignment.center,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 300,),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 70.0,
                        fontFamily: 'Canterbury',
                        color: Colors.black
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText('SkillKart'),
                        ],
                      ),
                    ),
                    SizedBox(height: 260,),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            blurRadius: 7.0,
                            color: Colors.black,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: AnimatedTextKit(
                        pause: Duration(microseconds: 200),
                        animatedTexts: [
                          FlickerAnimatedText('Powered By'),
                        ],
                      ),
                    ),
                    Image(
                        image: AssetImage('assets/images/Zairzalogo.webp'),
                      width: 300,
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );

  }
}
