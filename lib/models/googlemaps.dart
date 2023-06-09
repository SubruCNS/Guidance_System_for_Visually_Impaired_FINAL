import 'package:flutter_tts/flutter_tts.dart';
import 'package:mini/models/forMap.dart';
import 'package:flutter/material.dart';

class GoogleMap extends StatelessWidget {
  GoogleMap({Key? key}) : super(key: key);
  final List<String> itemList = [
    'Where To',
    ' Camera',
    'Ambulance',
    'Emergency Contacts',
    'Profile'
  ];
  Future<void> speakText(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.55);
    await flutterTts.speak(text);
  }

  final FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(6, 30, 69, 1),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 160,
            height: 160,
            child: TextButton(
              style: TextButton.styleFrom(
                elevation: 10,
                shadowColor: Color.fromRGBO(6, 30, 69, 1),
                backgroundColor: Color.fromRGBO(172, 212, 230, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                speakText(
                  'open google maps',
                );
                ;
              },
              onLongPress: () {
                MapUtils.openMap(8.4705, 76.9794);
                speakText(
                  'Opening google maps',
                );
              },
              child: Text(
                'Open              Google Maps',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(6, 30, 69, 1),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          // Add your onPressed code here!
        },
        backgroundColor: Color.fromRGBO(172, 212, 230, 1),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Color.fromRGBO(6, 30, 69, 1),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
