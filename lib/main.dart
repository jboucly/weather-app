import 'package:flutter/material.dart';
import 'package:weather/screens/homescreen.dart';
import 'package:weather/screens/settingsscreen.dart';
import 'package:weather/serializers/album.dart';
import 'package:weather/utils/fetch-album.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(context, futureAlbum),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
