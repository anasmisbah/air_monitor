import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/detail_carbon/bindings/detail_carbon_binding.dart';
import '../modules/detail_carbon/views/detail_carbon_view.dart';
import '../modules/detail_sulfur/bindings/detail_sulfur_binding.dart';
import '../modules/detail_sulfur/views/detail_sulfur_view.dart';
import '../modules/detail_temperature/bindings/detail_temperature_binding.dart';
import '../modules/detail_temperature/views/detail_temperature_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/information/bindings/information_binding.dart';
import '../modules/information/views/information_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CARBON,
      page: () => const DetailCarbonView(),
      binding: DetailCarbonBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SULFUR,
      page: () => const DetailSulfurView(),
      binding: DetailSulfurBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TEMPERATURE,
      page: () => const DetailTemperatureView(),
      binding: DetailTemperatureBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION,
      page: () => const InformationView(),
      binding: InformationBinding(),
    ),
  ];
}
