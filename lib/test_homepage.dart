import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mini/models/googlemaps.dart';
import 'package:mini/models/openscreen.dart';
import 'package:mini/pages/ambulance_call.dart';
import 'package:mini/pages/emergency_contacts.dart';

import 'package:mini/screen/homepage.dart';

class TestHomePage extends StatelessWidget {
  final List<String> itemList = [
    'Where To',
    'Camera',
    'Ambulance',
    'Emergency Contacts',
    'Profile'
  ];
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Message and Navigation'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemList[index]),
            onTap: () async {
              speakText(
                '${itemList[index]}',
              );
            },
            onLongPress: () {
              if (index == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoogleMap(),
                    ));
              } else if (index == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ambulance(),
                    ));
              } else if (index == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ambulance(),
                    ));
              } else if (index == 3) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmergencyContacts(),
                    ));
              } else if (index == 4) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainHomePage(),
                    ));
              }
            },
          );
        },
      ),
    );
  }

  Future<void> speakText(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.55);
    await flutterTts.speak(text);
  }

  void navigateToNewPage(BuildContext context, int index) {
    String pageTitle;
    String pageText;

    if (index == 0) {
      pageTitle = 'Page 1';
      pageText = 'Hello from Page 1';
    } else if (index == 1) {
      pageTitle = 'Page 2';
      pageText = 'Hello from Page 2';
    } else if (index == 2) {
      pageTitle = 'Page 3';
      pageText = 'Hello from Page 3';
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>OpenScreen(),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String title;
  final String text;

  NewPage({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
