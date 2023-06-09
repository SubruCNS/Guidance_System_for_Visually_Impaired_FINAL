import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mini/pages/emergency_contacts.dart';
import 'package:mini/screen/homepage.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OpenScreen extends StatelessWidget {
  Future<void> speakText(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.55);
    await flutterTts.speak(text);
  }

  final List<String> itemList = [
    'Where To',
    ' Camera',
    'Ambulance',
    'Emergency Contacts',
    'Profile'
  ];
  final FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(6, 30, 69, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // logo
              SizedBox(height: 75),
              // welcome back, you've been missed!
              GradientText(
                'WELCOME BlindSpot',
                style: const TextStyle(
                    fontSize: 37.0,
                    fontFamily: "SourceSansPro",
                    fontWeight: FontWeight.w500),
                colors: const [
                  Color.fromRGBO(67, 236, 227, 1),
                  Color.fromRGBO(20, 188, 233, 1)
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                child:
                    Image.asset('images/loginpagephoto-removebg-preview.png'),
              ),

              SizedBox(height: 10),

              // or continue with

              const SizedBox(height: 20),

              // not a member? register now
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientText(
                    'IF FOUND',
                    style: const TextStyle(
                        fontSize: 50.0,
                        fontFamily: "SourceSansPro",
                        fontWeight: FontWeight.w500),
                    colors: const [
                      Color.fromRGBO(67, 236, 227, 1),
                      Color.fromRGBO(20, 188, 233, 1)
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    tileColor: Color.fromRGBO(20, 188, 233, 1),
                    contentPadding: EdgeInsets.all(10),
                    title: const Text(
                      '               Contacts',
                      style: TextStyle(
                        color: Color.fromRGBO(6, 30, 69, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 20, color: Color.fromRGBO(6, 30, 69, 1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      speakText(
                        'Contacts',
                      );
                    },
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmergencyContacts(),
                          ));
                    },
                  ),
                  ListTile(
                    tileColor: Color.fromRGBO(20, 188, 233, 1),
                    contentPadding: EdgeInsets.all(10),
                    title: const Text(
                      '               Continue',
                      style: TextStyle(
                        color: Color.fromRGBO(6, 30, 69, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 20, color: Color.fromRGBO(6, 30, 69, 1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      speakText(
                        'Continue',
                      );
                    },
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainHomePage(),
                          ));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
