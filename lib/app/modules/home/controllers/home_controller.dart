import 'dart:developer';

import 'package:air_monitor/app/consntans/air_quality_index.dart';
import 'package:air_monitor/app/consntans/ui_state.dart';
import 'package:air_monitor/app/modules/home/providers/home_provider.dart';
import 'package:air_monitor/app/modules/home/weather_model_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:workmanager/workmanager.dart';

class HomeController extends GetxController {
  Rx<UIState> uistate = UIState.initial.obs;
  var weatherModel = WeatherModel().obs;
  var airQualityIndexModel = AirQualityIndex().obs;

  RxInt temp = 0.obs;

  @override
  void onInit() {
    getData();
    // getBackgroundData();
    super.onInit();
  }

  void getBackgroundData() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var permisionStatus = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    if (permisionStatus != null) {
      if (permisionStatus) {
        Workmanager().registerOneOffTask(
          "task-air-data",
          "task-air-data",
          initialDelay: const Duration(seconds: 30),
          constraints: Constraints(
            networkType: NetworkType.connected,
          ),
        );
        // Workmanager().registerPeriodicTask(
        //   "task-air-data",
        //   "task-air-data",
        //   initialDelay: Duration(seconds: 90),
        //   frequency: Duration(hours: 1),
        //   constraints: Constraints(
        //     networkType: NetworkType.connected,
        //   ),
        // );
      }
    }
  }

  void getData() async {
    uistate.value = UIState.loading;
    try {
      Position position = await _determinePosition();
      log("${position.latitude}:${position.longitude}");
      Response res = await HomeProvider()
          .getWeather(position.latitude, position.longitude);
      weatherModel.value = WeatherModel.fromJson(res.body);

      var aqi = await HomeProvider().getAqi();
      setAirQuality(aqi.body);

      var resTemp = await HomeProvider().getTemp();
      temp.value = (resTemp.body as double).round();

      uistate.value = UIState.success;
    } catch (e) {
      log(e.toString());
      uistate.value = UIState.error;
    }
  }

  void setAirQuality(dynamic aqi) {
    switch (aqi) {
      case <= 50:
        airQualityIndexModel.value = airQualityIndexData[0];
        break;
      case <= 100:
        airQualityIndexModel.value = airQualityIndexData[1];
        break;
      case <= 200:
        airQualityIndexModel.value = airQualityIndexData[2];
        break;
      case <= 300:
        airQualityIndexModel.value = airQualityIndexData[3];
        break;
      case >= 301:
        airQualityIndexModel.value = airQualityIndexData[4];
        break;
      default:
    }
    airQualityIndexModel.value.aqi = "${aqi}".length >= 4? "${aqi}".substring(0, 4):"${aqi}";
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
