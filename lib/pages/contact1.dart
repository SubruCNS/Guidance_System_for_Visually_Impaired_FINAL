import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Contact1 extends StatelessWidget {
  const Contact1({Key? key}) : super(key: key);
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
                shadowColor: Color.fromRGBO(128, 45, 83, 1),
                backgroundColor: Color.fromRGBO(172, 212, 230, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                FlutterPhoneDirectCaller.callNumber('+91 8281116219');
              },
              child: Text(
                'Call',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 40,
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
