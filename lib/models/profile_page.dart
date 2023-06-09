import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mini/models/openscreen.dart';
import 'package:mini/pages/emergency_contacts.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProfileScreen extends StatelessWidget {
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
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(6, 30, 69, 1),
        shadowColor: Color.fromRGBO(128, 45, 83, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OpenScreen(),
                ));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Color.fromRGBO(67, 236, 227, 1),
          iconSize: 37,
        ),
      ),
      backgroundColor: Color.fromRGBO(6, 30, 69, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // logo
            SizedBox(height: 10),
            // welcome back, you've been missed!
            GradientText(
              'THIS BELONGS TO',
              style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: "SourceSansPro",
                  fontWeight: FontWeight.w500),
              colors: const [
                Color.fromRGBO(67, 236, 227, 1),
                Color.fromRGBO(20, 188, 233, 1)
              ],
            ),

            Container(
              height: 200,
              child: Image.asset('images/profile.png'),
            ),

            const Text(
              'User',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromRGBO(20, 188, 233, 1),
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'test@gmail.com',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromRGBO(20, 188, 233, 1),
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'SCTCE,Pappanmcode',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromRGBO(20, 188, 233, 1),
              ),
            ),

            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Color.fromRGBO(20, 188, 233, 1),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // not a member? register now
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientText(
                  'IF FOUND CONTACT',
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontFamily: "SourceSansPro",
                  ),
                  colors: const [
                    Color.fromRGBO(67, 236, 227, 1),
                    Color.fromRGBO(20, 188, 233, 1)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  tileColor: Color.fromRGBO(20, 188, 233, 1),
                  contentPadding: EdgeInsets.all(10),
                  title: const Text(
                    '            Contacts',
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
