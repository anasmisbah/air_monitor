import 'package:get/get.dart';

class HomeProvider extends GetConnect {
  Future<Response> getWeather(double lat, double long) {
    return get("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=10143a053c565930cc9bbb73093f994b&units=metric&lang=id",);
  }
}
