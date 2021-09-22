import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:talian_test_app/controller/controller.dart';
import 'package:talian_test_app/models/services/services.dart';

void setup() {
  configNetwork();
  configServices();
  configController();
}

void configNetwork() {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  Get.put(dio);
}

void configServices() {
  Get.put(Services(Get.find()));
}

void configController() {
  Get.put(Controller(Get.find()));
}
