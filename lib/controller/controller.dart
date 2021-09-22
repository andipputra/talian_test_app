import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talian_test_app/models/data/movies.dart';
import 'package:talian_test_app/models/services/services.dart';

class Controller extends GetxController {
  var listMovies = <Movies>[].obs;

  var currentIdx = 1.obs;

  var isError = false.obs;

  var isLastPage = false.obs;

  final Services services;

  Controller(this.services);

  @override
  void onInit() {
    getListMovies();
    super.onInit();
  }

  void getNextMovies() async {
    currentIdx++;

    getListMovies();
  }

  void getListMovies() async {
    try {
      final response = await services.getMovies(page: currentIdx.value);

      isError.value = false;

      if (response.page == response.totalPages) {
        isLastPage.value = true;
      }

      listMovies.addAll(response.results!);
    } on DioError catch (e) {
      isError.value = true;
    }

    // if (response.statusCode == 200) {
    //   print('data');

    //   // listMovies.value = response.data!.results;
    // } else {
    //   Get.snackbar(
    //     'Error',
    //     'Get Movies List Error',
    //     backgroundColor: Colors.blue,
    //   );
    // }
  }
}
