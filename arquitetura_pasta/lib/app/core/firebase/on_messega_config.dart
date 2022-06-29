import 'dart:io';

import 'package:arquitetura_pasta/app/core/firebase/notification_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging_platform_interface/firebase_messaging_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const grey = Color(0xFF8E8E93);

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  final data = (message.data['data'] as Map).cast<String, dynamic>();
  // if (await Intercom.isIntercomPush(data)) {
  //   await Intercom.handlePush(data);
  //   return;
  // }
//  NotificationModel notification = NotificationModel.fromMap(message.data);
}

class OnMessageConfig {
  FirebaseMessaging? firebaseMessaging;
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  AndroidNotificationChannel? channel;

  OnMessageConfig(this.firebaseMessaging, this.flutterLocalNotificationsPlugin,
      this.channel);

  bool isAndroid = Platform.isAndroid;
  bool iOS = Platform.isIOS;

  init() async {
    _requestPermissions();
    if (isAndroid) {
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
    }

    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);
  }

  void _requestPermissions() {
    firebaseMessaging!.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    firebaseMessaging!.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );

    flutterLocalNotificationsPlugin!.pendingNotificationRequests();
    flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  messagingConfigure() async {
    init();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotificationModel notifications = NotificationModel.fromMap(message.data);

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(message);
    });
  }
}
