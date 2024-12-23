import 'package:flutter/material.dart';
import 'package:jokes/models/joke.dart';

import 'details_joke.dart';

class DetailData extends StatefulWidget {
  final Joke joke;
  const DetailData({super.key, required this.joke});

  @override
  State<DetailData> createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.redAccent[100],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailContainerText(joke: widget.joke),
          ],
        ));
  }
}