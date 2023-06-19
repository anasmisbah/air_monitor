import 'dart:developer';

import 'package:air_monitor/app/consntans/ui_state.dart';
import 'package:air_monitor/app/modules/home/providers/home_provider.dart';
import 'package:air_monitor/app/modules/home/weather_model_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  Rx<UIState> uistate = UIState.initial.obs;
  var weatherModel = WeatherModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
    AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
    super.onInit();
  }

  void getData() async {
    uistate.value = UIState.loading;
    try {
      Position position = await _determinePosition();
      log("${position.latitude}:${position.longitude}");
      Response res = await HomeProvider()
          .getWeather(position.latitude, position.longitude);
      weatherModel.value = WeatherModel.fromJson(res.body);
      uistate.value = UIState.success;
    } catch (e) {
      uistate.value = UIState.error;
    }
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Pagi';
    }
    if (hour < 17) {
      return 'Siang';
    }
    return 'Malam';
  }

  String today() {
    initializeDateFormatting('id_ID', null).then((_) => {});
    var format = DateFormat.yMMMMd('id_ID');
    var dateString = format.format(DateTime.now());
    return dateString;
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
