import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  final List<Marker> _markers = <Marker>[];
  late LatLng _startingPosition;

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  stt.SpeechToText _speechToText = stt.SpeechToText();
  FlutterTts _flutterTts = FlutterTts();

  String _destination = '';
  bool _isListening = false;

  void _listen() async {
    if (!_isListening) {
      bool available = await _speechToText.initialize(
        onStatus: (status) {},
        onError: (error) {},
      );

      if (available) {
        setState(() => _isListening = true);
        _speechToText.listen(
          onResult: (result) {
            setState(() {
              _destination = result.recognizedWords;
            });
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      _speechToText.stop();
    }
  }

  void _speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.speak(text);
  }

  @override
  void initState() {
    super.initState();
    _startingPosition = LatLng(20.42796133580664, 75.885749655962);
    _markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: _startingPosition,
        infoWindow: InfoWindow(
          title: 'My Position',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Navigation"),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    _destination = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Destination',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
              ElevatedButton(
                onPressed: _listen,
                child: Text(_isListening ? 'Listening...' : 'Voice Input'),
              ),
              Expanded(
                child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: _startingPosition, zoom: 14),
                  markers: Set<Marker>.of(_markers),
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () async {
              final String url =
                  'https://www.google.com/maps/dir/?api=1&origin=${_startingPosition.latitude},${_startingPosition.longitude}&destination=$_destination';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Icon(Icons.directions),
          ),
        ),
      ),
    );
  }
}