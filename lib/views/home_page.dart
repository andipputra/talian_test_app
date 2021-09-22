import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:talian_test_app/controller/controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final Controller _c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
        centerTitle: true,
      ),
      body: Obx(
        () => LazyLoadScrollView(
          onEndOfPage: _c.getNextMovies,
          isLoading: _c.isLastPage.value,
          child: ListView.builder( 
            itemBuilder: (ctx, i) => ListTile(
              title: Text(_c.listMovies[i].title),
              subtitle:
                  Text(DateFormat.yMMMd().format(_c.listMovies[i].releaseDate)),
              leading: Image.network(
                  'https://image.tmdb.org/t/p/w500${_c.listMovies[i].posterPath}'),
            ),
            itemCount: _c.listMovies.length,
          ),
        ),
      ),
    );
  }
}
