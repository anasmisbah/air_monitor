import 'dart:developer';

import 'package:air_monitor/app/modules/home/providers/home_provider.dart';
import 'package:air_monitor/app/modules/home/weather_model_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:workmanager/workmanager.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();
  static void initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    // =======================
    // TODO ADD IOS CONFIG HERE
    // =======================

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _notificationPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) {},
    );

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await _notificationPlugin.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      var selectedNotificationPayload =
          notificationAppLaunchDetails!.notificationResponse;
      log("From local notif : " + selectedNotificationPayload.toString());
    }
  }

  static void displayNotification(String title,String body) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'air_monitor',
        'air_monitor',
        channelDescription: 'air_monitor',
        importance: Importance.max,
        priority: Priority.high,
      );
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await _notificationPlugin.show(
        id,
        title,
        body,
        platformChannelSpecifics,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
