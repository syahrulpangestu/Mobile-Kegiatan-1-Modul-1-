import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

initializeNotification() async {
  final fcm = FirebaseMessaging.instance;
  final message = await fcm.getInitialMessage();
  if (message != null) {
    final data = message.data;
    debugPrint("Dapat iniii $data");
  }
  debugPrint(
      "Token: ${(await FirebaseMessaging.instance.getToken()).toString()}");
  try {
    if (Platform.isAndroid) {
      await fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      await fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      FirebaseMessaging.onMessage.listen(_onMessage);
      FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_onOpen);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  FirebaseMessaging.onMessage.listen(_onMessage);
  FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(_onOpen);
}

void _onMessage(RemoteMessage message) {
  debugPrint("ada pesan nich ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
  RemoteNotification? notification = message.notification;
  AndroidNotification? androidNotification = message.notification?.android;
  if (notification != null && androidNotification != null) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }
}

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  debugPrint("ada pesan nich ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
}

void _onOpen(RemoteMessage message) async {
  final data = message.data;
  debugPrint("Dapat iniii $data");
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.max,
);
