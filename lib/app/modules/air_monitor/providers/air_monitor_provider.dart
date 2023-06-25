import 'package:air_monitor/app/consntans/air_quality_index.dart';
import 'package:get/get.dart';

class AirMonitorProvider extends GetConnect {
  Future<Response> getAqi() {
    return get("https://backend.thinger.io/v3/users/KelasKilat/devices/AirQuality/resources/AQI",headers: {
      "Authorization":bearerToken,
    });
  }
  
  Future<Response> getTemp() {
    return get("https://backend.thinger.io/v3/users/KelasKilat/devices/AirQuality/resources/temp",headers: {
      "Authorization":bearerToken,
    });
  }

  Future<Response> getHum() {
    return get("https://backend.thinger.io/v3/users/KelasKilat/devices/AirQuality/resources/hum",headers: {
      "Authorization":bearerToken,
    });
  }

  Future<Response> getCO() {
    return get("https://backend.thinger.io/v3/users/KelasKilat/devices/AirQuality/resources/CO",headers: {
      "Authorization":bearerToken,
    });
  }

  Future<Response> getCO2() {
    return get("https://backend.thinger.io/v3/users/KelasKilat/devices/AirQuality/resources/CO2",headers: {
      "Authorization":bearerToken,
    });
  }

  Future<Response> getNH3() {
    return get("https://backend.thinger.io/v3/users/KelasKilat/devices/AirQuality/resources/NH3",headers: {
      "Authorization":bearerToken,
    });
  }

  Future<Response> gethPa() {
    return get("https://backend.thinger.io/v3/users/KelasKilat/devices/AirQuality/resources/hPa",headers: {
      "Authorization":bearerToken,
    });
  }

  Future<Response> getAltitude() {
    return get("https://backend.thinger.io/v3/users/KelasKilat/devices/AirQuality/resources/Altitude",headers: {
      "Authorization":bearerToken,
    });
  }


}
