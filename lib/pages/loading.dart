import 'package:flutter/material.dart';
import 'package:wroldclock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWroldTIme() async {
    WorldTime inst = WorldTime(
        location: 'Berlin', flag: 'germany.png', urlTime: 'Europe/Berlin');
    await inst.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': inst.location,
      'flag': inst.flag,
      'urlTime': inst.urlTime,
      'isDaytime': inst.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWroldTIme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
