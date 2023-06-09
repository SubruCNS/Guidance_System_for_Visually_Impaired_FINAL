import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mini/main.dart';
import 'package:mini/models/openscreen.dart';

import 'package:mini/models/profile_page.dart';


import 'package:mini/screen/homepage_grid.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'realtime/live_camera.dart';

class MainHomePage extends StatelessWidget {
  void signUserOut() {}
  Future<void> speakText(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);

    await flutterTts.setSpeechRate(0.51);
    await flutterTts.speak(text);
  }

  final FlutterTts flutterTts = FlutterTts();
  final List<String> itemList = ['Home', 'Camera', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Color.fromRGBO(6, 30, 69, 1),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 20),
          child: GNav(
            backgroundColor: Color.fromRGBO(6, 30, 69, 1),
            gap: 8,
            tabBackgroundColor: Color.fromRGBO(172, 212, 230, 1),
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),
            tabs: [
              GButton(
                icon: Icons.home,
                iconColor: Color.fromRGBO(67, 236, 227, 1),
                iconActiveColor: Color.fromRGBO(6, 30, 69, 1),
                text: 'Home',
                textStyle: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                iconSize: 25,
                onPressed: () async {
                  speakText(
                    'home',
                  );
                },
              ),
              GButton(
                icon: Icons.remove_red_eye,
                iconColor: Color.fromRGBO(44, 212, 230, 1),
                iconActiveColor: Color.fromRGBO(6, 30, 69, 1),
                text: 'Camera',
                textStyle: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
                iconSize: 33,
                onPressed: () async {
                  speakText(
                    'Camera',
                  );
                     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LiveFeed(cameras),
                  ));
                },
              ),
              GButton(
                icon: Icons.settings,
                iconColor: Color.fromRGBO(20, 188, 233, 1),
                iconActiveColor: Color.fromRGBO(6, 30, 69, 1),
                text: 'Settings',
                textStyle: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                iconSize: 25,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(6, 30, 69, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(6, 30, 69, 1),
        shadowColor: Color.fromRGBO(128, 45, 83, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            speakText(
              'Hello!!!....Welcome to our app..............To navigate through the app.....click on a button to know what it does..............long press to use it',
            );
          },
          icon: const Icon(Icons.front_hand),
          color: Color.fromRGBO(67, 236, 227, 1),
          iconSize: 37,
        ),
        title: Image.asset('images/appbar_image.png'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              size: 35,
              color: Color.fromRGBO(6, 30, 69, 1),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenScreen(),
                  ));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GradientText(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 33.0,
                fontWeight: FontWeight.w500,
              ),
              colors: [
                Color.fromRGBO(67, 236, 227, 1),
                Color.fromRGBO(20, 188, 233, 1)
              ],
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MainHomePageGrid(),
          )
        ],
      ),
    );
  }
}
