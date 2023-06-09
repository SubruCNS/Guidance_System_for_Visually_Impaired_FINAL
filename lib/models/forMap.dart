import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    var googleMapUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(googleMapUrl as Uri)) {
      await launchUrl(googleMapUrl as Uri);
    } else {
      throw 'Could not open the map.';
    }
  }
}
