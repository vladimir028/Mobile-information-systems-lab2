import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jokes/models/joke.dart';
import 'package:jokes/services/api_services.dart';

import '../widgets/details_container.dart';

class MyRandomJokePage extends StatefulWidget {
  const MyRandomJokePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyRandomPageState();
}

class _MyRandomPageState extends State<MyRandomJokePage> {
  Joke joke = Joke(type: "type", setup: "setup", punchline: "punchline", id: -1);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadRandomJokeApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Joke"),
      ),
      body: joke.id == -1
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailData(joke: joke),
          ],
        ),
      ),
    );
  }

  void loadRandomJokeApi() {
    ApiService.getRandomJokeFromAPI().then((response) {
      var data = json.decode(response.body);
      setState(() {
        joke = Joke.fromJson(data);
      });
    }).catchError((error) {
      print("Error fetching joke: $error");
    });
  }
}
