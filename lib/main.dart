import 'package:google_maps_app/gmap.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding with Curry',
      theme: ThemeData(
        primarySwatch: Color.fromARGB(255, 58, 148, 183),
      ),
      home: const MyHomePage(title: 'Coding with Curry'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _getLocationPermission();
  }

  void _getLocationPermission() async {
    var location = Location();
    try {
      location.requestPermission();
    } on Exception catch (_) {
      print('There was a problem allowing location access');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Using Google Maps in Flutter',
                style: TextStyle(fontSize: 42),
              ),
              SizedBox(height: 20),
              Text(
                'The google_maps_flutter package is still in the Developers Preview status, so make sure you monitor changes closely when using it. There will likely be breaking changes in the near future.',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: const Icon(Icons.map),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GMap(
              key: UniqueKey(),
              title: '',
            ),
          ),
        ),
      ),
    );
  }
}
