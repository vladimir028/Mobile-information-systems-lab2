import 'package:flutter/material.dart';
import 'package:jokes/services/api_services.dart';

import '../models/joke.dart';
import '../widgets/details_container.dart';

class FavoriteJokes extends StatefulWidget {
  const FavoriteJokes({super.key});

  @override
  State<FavoriteJokes> createState() => _FavoriteJokesState();
}

class _FavoriteJokesState extends State<FavoriteJokes> {
  ApiService service = ApiService();
  List<Joke> favoriteJokes = [];

  @override
  void initState() {
    _fetchFavoriteJokes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Jokes"),
      ),
      body: favoriteJokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: favoriteJokes.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DetailData(joke: favoriteJokes[index]),
                  ],
                );
              },
            ),
    );
  }

  void _fetchFavoriteJokes() async {
    List<Joke>? jokes = await service.getAllFavoriteJokes();
    if (jokes != null) {
      setState(() {
        favoriteJokes = jokes;
      });
    }
  }
}
