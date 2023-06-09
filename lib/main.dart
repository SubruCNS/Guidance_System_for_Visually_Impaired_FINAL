import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini/firebase_options.dart';
import 'package:mini/models/openscreen.dart';

// import 'package:miniproject/models/profile_page.dart';
// import 'package:miniproject/pages/loginpage.dart';
// import 'package:miniproject/screen/homepage.dart';
// import 'package:miniproject/screen/homepage_grid.dart';
// import 'package:miniproject/test_homepage.dart';
List<CameraDescription> cameras = [];

Future<void> main() async {
  // initialize the cameras when the app starts
  WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  // running the app
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpenScreen(),
    );
  }
}
