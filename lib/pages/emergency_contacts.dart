import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mini/pages/emergency_contacts_grid.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class EmergencyContacts extends StatelessWidget {
  void signUserOut() {}
  Future<void> speakText(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.55);
    await flutterTts.speak(text);
  }

  final FlutterTts flutterTts = FlutterTts();
  final List<String> itemList = ['Home', 'Camera', 'Profile'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(6, 30, 69, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(6, 30, 69, 1),
        shadowColor: Color.fromRGBO(128, 45, 83, 1),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.call,
              size: 50,
              color: Color.fromRGBO(20, 188, 233, 1),
            ),
            onPressed: () {
              speakText(
                'Call',
              );
            },
          ),
          SizedBox(width: 180),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GradientText(
              'EMERGENCY CONTACTS',
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 33.0,
                fontWeight: FontWeight.w700,
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
            child: EmergencyContactsGrid(),
          )
        ],
      ),
    );
  }
}
