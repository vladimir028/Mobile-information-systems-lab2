import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jokes/models/joke.dart';

import '../services/api_services.dart';
import '../widgets/details_container.dart';

class MyDetailsPage extends StatefulWidget {
  const MyDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() => _DetailsState();
}

class _DetailsState extends State<MyDetailsPage> {
  String type = "";
  List<Joke> jokes = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as String;
    type = arguments.toString();
    print(type);
    if (type.isNotEmpty) {
      getJokeFromCertainType(type);
      print("isprinat e tipot $type");
    }
  }

  void getJokeFromCertainType(String type) async {
    ApiService.getAbilitiesForPokemon(type).then((response) {
      var data = List.from(json.decode(response.body));
      print("ova e data $data");
      setState(() {
        jokes = data.asMap().entries.map((element) {
          return Joke.fromJson(element.value);
        }).toList();
        print("jokes e data $jokes");
      });
      print("response: $response");
    }).catchError((error) {
      print("Error: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokes"),
      ),
      body: jokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DetailData(joke: jokes[index]),
                  ],
                );
              },
            ),
    );
  }
}
