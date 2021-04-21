import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String urlTime;
  String url;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.urlTime});

  Future<void> getTime() async {
    try {
      final url = await http
          .get(Uri.https('worldtimeapi.org', 'api/timezone/$urlTime'));
      Map data = jsonDecode(url.body);
      // print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      urlTime = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      urlTime = 'Could not get time data';
    }
  }
}
