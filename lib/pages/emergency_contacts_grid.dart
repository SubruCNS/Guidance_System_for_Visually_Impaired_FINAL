import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:mini/pages/contact1.dart';
import 'package:mini/pages/contact2.dart';
import 'package:mini/pages/contact3.dart';
import 'package:mini/pages/contact4.dart';
import 'package:mini/pages/contact5.dart';

import 'package:mini/pages/emergency_grid.dart';
import 'package:mini/screen/grid.dart';


import 'package:mini/utils/utils.dart';


class EmergencyContactsGrid extends StatelessWidget {
  Future<void> speakText(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.55);
    await flutterTts.speak(text);
  }

  final List<String> itemList = [
    'Harikrishnan',
    'Vignesh',
    'Subramaniam',
    'Devika',
    'Soja Miss'
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
                    builder: (context) => Contact1(),
                  ));
            }

            if (i == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contact2(),
                  ));
            }

            if (i == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contact3(),
                  ));
            }

            if (i == 3) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contact4(),
                  ));
            }

            if (i == 5) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contact5(),
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
                  height: 22,
                ),
                Text(
                  Emergencygrid.grid[i].title,
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
