import 'package:bloc_sample/core/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  @GET("/posts")
  Future<List<PostModel>> getPosts();
}
