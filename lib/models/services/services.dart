import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talian_test_app/models/data/api_response.dart';

part 'services.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/movie")
abstract class Services {
  factory Services(Dio dio, {String baseUrl}) = _Services;

  @GET("/popular")
  Future<ApiResponse> getMovies({
    @Query('api_key') String? apiKey = 'ed3fd6b1c14eeea444e9e2a40317daef',
    @Query('language') String? language = 'en-US',
    @Query('page') int? page,
  });
}

// class Services {
//   final Dio dio;

//   Services(this.dio);

//   Future<Response> getMovies({int? page}) async {
//     final res = await dio.get(
//         'https://api.themoviedb.org/3/movie/popular',
//         queryParameters: {
//           'api_key': 'ed3fd6b1c14eeea444e9e2a40317daef',
//           'language': 'en-US',
//           'page': page
//         });

//     return res;
//   }
// }


