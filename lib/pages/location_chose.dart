import 'package:flutter/material.dart';
import 'package:wroldclock/services/world_time.dart';

class ChoosLocation extends StatefulWidget {
  @override
  _ChoosLocationState createState() => _ChoosLocationState();
}

class _ChoosLocationState extends State<ChoosLocation> {
  List<WorldTime> locations = [
    WorldTime(urlTime: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urlTime: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urlTime: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        urlTime: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urlTime: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        urlTime: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(
        urlTime: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        urlTime: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime inst = locations[index];
    await inst.getTime();
    Navigator.pop(context, {
      'location': inst.location,
      'flag': inst.flag,
      'urlTime': inst.urlTime,
      'isDaytime': inst.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          backgroundColor: Colors.cyan[800],
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
