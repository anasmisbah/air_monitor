import 'dart:developer';

import 'package:air_monitor/app/utils/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initialize();
  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );
  Workmanager().registerPeriodicTask("task-air-data", "task-air-data",
      initialDelay: Duration(minutes: 1),
      frequency: Duration(
        minutes: 30,
      ),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ));
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        title: "Application",
        initialRoute: Routes.SPLASH_SCREEN,
        getPages: AppPages.routes,
        theme: ThemeData(fontFamily: 'Poppins'),
      ),
    ),
  );
}

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    log("Native called background task: $task"); //simpleTask will be emitted here.
    // NotificationService.displayNotification();
    return Future.value(true);
  });
}
