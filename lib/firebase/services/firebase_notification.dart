import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('title:${message.notification?.title}');
  print('title:${message.notification?.body}');
  print('title:${message.data}');
}

class FirebaseNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("Token is : $fcmToken");
    print("hello bro");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
