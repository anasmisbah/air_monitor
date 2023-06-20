import 'package:air_monitor/app/consntans/color.dart';
import 'package:flutter/material.dart';

class AirQualityIndex {
  final String status;
  final String image;
  final String value;
  final String desc;
  final Color color;

  AirQualityIndex({
    required this.status,
    required this.image,
    required this.value,
    required this.desc,
    required this.color,
  });
}

List<AirQualityIndex> airQualityIndexData = [
  AirQualityIndex(
    status: "Baik",
    image: "assets/images/aqi_1.png",
    value: "0-50",
    color: AppColor.aqi_1,
    desc:
        "Tingkat kualitas udara yang sangat baik, tidak memberikan efek negative terhadap manusia, hewan, dan tumbuhan",
  ),
  AirQualityIndex(
    status: "SEDANG",
    image: "assets/images/aqi_2.png",
    value: "51-100",
    color: AppColor.aqi_2,
    desc:
        "Tingkat kualitas udara masih dapat diterima pada kesehatan manusia, hewan, dan tumbuhan.",
  ),
  AirQualityIndex(
    status: "TIDAK SEHAT",
    image: "assets/images/aqi_3.png",
    value: "101-200",
    color: AppColor.aqi_3,
    desc:
        "Tingkat kualitas udara yang bersifat merugikan pada manusia, hewan, dan tumbuhan",
  ),
  AirQualityIndex(
    status: "SANGAT TIDAK SEHAT",
    image: "assets/images/aqi_4.png",
    value: "201-300",
    color: AppColor.aqi_4,
    desc:
        "Tingkat kualitas udara yang dapat meningkatkan resiko kesehatan pada sejumlah segmen populasi yang terpapar.",
  ),
  AirQualityIndex(
    status: "BERBAHAYA",
    image: "assets/images/aqi_5.png",
    value: ">=301",
    color: AppColor.aqi_5,
    desc:
        "Tingkat kualitas udara yang dapat merugikan kesehatan serius pada populasi dan perlu penanganan cepat.",
  ),
];
