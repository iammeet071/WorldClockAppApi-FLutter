import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.indigo[200] : Colors.grey[850];
    Color txtColor = data['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/$bgImage',
                ),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 160, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'urlTime': result['urlTime'],
                      'location': result['location'],
                      'flag': result['flag'],
                      'isDaytime': result['isDaytime'],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.blue[900],
                ),
                label: Text(
                  'Choose Location',
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 28.0,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data['urlTime'],
                style: TextStyle(
                    fontSize: 48.0, letterSpacing: 2, color: txtColor),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
