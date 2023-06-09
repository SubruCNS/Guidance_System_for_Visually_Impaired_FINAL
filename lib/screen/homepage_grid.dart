import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mini/main.dart';
import 'package:mini/pages/emergency_contacts.dart';
import 'package:mini/screen/gmap/Homepage.dart';
import 'package:mini/screen/grid.dart';

import 'package:mini/models/profile_page.dart';
import 'package:mini/pages/ambulance_call.dart';

import 'package:mini/screen/realtime/live_camera.dart';
import 'package:mini/utils/utils.dart';

class MainHomePageGrid extends StatelessWidget {
  Future<void> speakText(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.55);
    await flutterTts.speak(text);
  }

  final List<String> itemList = [
    'Camera',
    ' Where To?',
    'Emergency Contacts',
    'Ambulance',
    'Profile'
  ];
  final FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (contextl, _) => const SizedBox(height: 6),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: allGrid.grid.length,

      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () async {
            speakText(
              '${itemList[i]}',
            );
          },
          onLongPress: () async {
            if (i == 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LiveFeed(cameras),
                  ));
            }

            if (i == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            }

            if (i == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmergencyContacts(),
                  ));
            }

            if (i == 3) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Ambulance(),
                  ));
            }

            if (i == 4) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
            }
          },
          child: Container(
            margin: EdgeInsets.only(left: 0, right: 0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(172, 212, 230, 1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(128, 45, 83, 1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  allGrid.grid[i].title,
                  style: MainHeading,
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
      //griddelegates shows how many items u want in a particular row
    );
  }
}
