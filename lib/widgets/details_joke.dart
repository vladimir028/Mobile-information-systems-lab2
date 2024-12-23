import 'package:flutter/material.dart';
import 'package:jokes/models/joke.dart';
import 'package:jokes/services/api_services.dart';

class DetailContainerText extends StatefulWidget {
  final Joke joke;

  const DetailContainerText({super.key, required this.joke});

  @override
  State<DetailContainerText> createState() => _DetailContainerTextState();
}

class _DetailContainerTextState extends State<DetailContainerText> {
  ApiService service = ApiService();
  IconData outlinedFavorite = Icons.favorite_border;
  IconData filledFavorite = Icons.favorite;

  bool isFavorite = false;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Type: ${widget.joke.type}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Setup: ${widget.joke.setup}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Punchline: ${widget.joke.punchline}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "ID: ${widget.joke.id}",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          child: IconButton(
            onPressed: () => setLike(widget.joke),
            // onPressed: () => {},
            icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> setLike(Joke joke) async {
    await service.addToFavorite(joke);
    setState(() {
      isFavorite = !isFavorite;
    });
  }
}
