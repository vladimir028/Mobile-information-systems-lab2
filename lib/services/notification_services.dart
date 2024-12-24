import 'package:firebase_messaging/firebase_messaging.dart';

import '../main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    await _firebaseMessaging.subscribeToTopic("lab-exercises");

    final fcmToken = await _firebaseMessaging.getToken();

    print("fcmToken: $fcmToken");
    navigatorKey.currentState?.pushNamed("/random_joke");
  }
}
