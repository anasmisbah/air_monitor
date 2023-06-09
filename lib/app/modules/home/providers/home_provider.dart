import 'package:air_monitor/app/consntans/air_quality_index.dart';
import 'package:get/get.dart';

class HomeProvider extends GetConnect {
  Future<Response> getWeather(double lat, double long) {
    return get("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=10143a053c565930cc9bbb73093f994b&units=metric&lang=id",);
  }

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


}
