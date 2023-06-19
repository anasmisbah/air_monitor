

import 'dart:developer';

import 'package:air_monitor/app/modules/home/providers/home_provider.dart';
import 'package:air_monitor/app/modules/home/weather_model_model.dart';
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
          false // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );

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

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
  void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {
      log("Native called background task: $task"); //simpleTask will be emitted here.
      // TODO: experimental only
       Response res=  await HomeProvider().getWeather(-0.5278, 117.1684);
      WeatherModel weatherModel = WeatherModel.fromJson(res.body);
      NotificationService.displayNotification('Update Cuaca Terbaru ditempat anda','${weatherModel.weather?.first.description}');
      return Future.value(true);
    });
  }


