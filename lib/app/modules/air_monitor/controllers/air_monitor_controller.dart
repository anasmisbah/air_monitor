import 'dart:developer';

import 'package:air_monitor/app/consntans/air_quality_index.dart';
import 'package:air_monitor/app/consntans/ui_state.dart';
import 'package:air_monitor/app/modules/air_monitor/providers/air_monitor_provider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AirMonitorController extends GetxController {
  Rx<UIState> uistate = UIState.initial.obs;
  Rx<AirQualityIndex> airQualityIndexModel = AirQualityIndex().obs;
  var altitude = '0'.obs;
  var co = '0'.obs;
  var co2 = '0'.obs;
  var nh3 = '0'.obs;
  var hpa = '0'.obs;
  var hum = '0'.obs;
  var temp = '0'.obs;

  RxString lastUpdate = "0/0/0000 00:00:00".obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    uistate.value = UIState.loading;
    try {
      var res = await Future.wait([
        AirMonitorProvider().getAqi(), //0
        AirMonitorProvider().getAltitude(), //1
        AirMonitorProvider().getCO(), //2
        AirMonitorProvider().getCO2(), //3
        AirMonitorProvider().getNH3(), //4
        AirMonitorProvider().gethPa(), //5
        AirMonitorProvider().getHum(), //6
        AirMonitorProvider().getTemp(), //7
      ]);
      log(res.first.body.toString());
      setAirQuality(res[0].body);

      altitude.value = "${res[1].body}".length >= 4
          ? "${res[1].body}".substring(0, 4)
          : "${res[1].body}";
      co.value = "${res[2].body}".length >= 4
          ? "${res[2].body}".substring(0, 4)
          : "${res[2].body}";
      co2.value = "${res[3].body}".length >= 4
          ? "${res[3].body}".substring(0, 4)
          : "${res[3].body}";
      nh3.value = "${res[4].body}".length >= 4
          ? "${res[4].body}".substring(0, 4)
          : "${res[4].body}";
      hpa.value = "${res[5].body}".length >= 4
          ? "${res[5].body}".substring(0, 4)
          : "${res[5].body}";
      hum.value = "${res[6].body}".length >= 4
          ? "${res[6].body}".substring(0, 4)
          : "${res[6].body}";
      temp.value = "${res[7].body}".length >= 4
          ? "${res[7].body}".substring(0, 4)
          : "${res[7].body}";

      lastUpdate.value =
          DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());
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
    airQualityIndexModel.value.aqi =
        "${aqi}".length >= 4 ? "${aqi}".substring(0, 4) : "${aqi}";
  }
}
