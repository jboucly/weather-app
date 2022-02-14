import 'dart:core';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../serializers/album.dart';

class HomeScreen extends StatelessWidget {
  BuildContext context;
  Future<Album> futureAlbum;

  HomeScreen(this.context, this.futureAlbum, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade500,
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _dataLoader(),
              _cloudIcon(),
              _temperature(),
              _location(),
              _date(),
              _hourlyPrediction(),
              _weekPrediction(),
            ],
          ),
        ),
      ),
    );
  }

  _dataLoader() {
    return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  _cloudIcon() {
    return const Padding(
      padding: EdgeInsets.all(28.0),
      child: Icon(Icons.cloud, size: 80),
    );
  }

  _temperature() {
    return const Text('20°C',
        style: TextStyle(fontSize: 80, fontWeight: FontWeight.w100));
  }

  _location() {
    return Row(
      children: const [
        Icon(Icons.place),
        SizedBox(width: 10),
        Text('Rennes, FR')
      ],
    );
  }

  _date() {
    return Row(
      children: [
        const Text('Aujourd\'hui :'),
        const SizedBox(width: 5),
        Text(DateFormat('dd/MM/yyyy').format(DateTime.now())),
      ],
    );
  }

  final List<String> times = ['1', '2', '3', '1', '2', '3'];

  _hourlyPrediction() {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.white, width: 1),
            bottom: BorderSide(color: Colors.white, width: 1)),
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: times.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 100,
              child: Card(
                child: Center(
                  child: Text(times[index]),
                ),
              ),
            );
          }),
    );
  }

  final List<String> weeks = [
    '1',
    '2',
    '3',
    '1',
    '2',
    '3',
    '1',
    '2',
    '3',
    '1',
    '2',
    '3',
  ];

  _weekPrediction() {
    return Expanded(
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.white, width: 1),
              bottom: BorderSide(color: Colors.white, width: 1)),
        ),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: weeks.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 50,
                child: Card(
                  child: Center(
                    child: Text(weeks[index]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
