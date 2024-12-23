import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:jokes/firebase_options.dart';
import 'package:jokes/screens/details_page.dart';
import 'package:jokes/screens/favorite_jokes.dart';
import 'package:jokes/screens/home_page.dart';
import 'package:jokes/screens/random_joke.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  await FirebaseMessaging.instance.subscribeToTopic("lab-exercises");
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("FCM Token: $fcmToken");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) =>  const MyHomePage(navBarTitle: 'Lab 2 developed by 211028'),
        "/details": (context) => const MyDetailsPage(),
        "/random_joke": (context) => const MyRandomJokePage(),
        "/favorite_jokes": (context) => const FavoriteJokes()
      },
    );
  }
}

