import 'package:dio/dio.dart';
import 'package:jsonplaceholder/api/reqs/login.request.dart';
import 'package:jsonplaceholder/models/post.dart';
import 'package:jsonplaceholder/services/token.storage.service.dart';
import 'package:retrofit/retrofit.dart';

part 'rest.client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/posts')
  Future<List<Post>> getAllPosts();

  @GET('/posts/{id}')
  Future<Post> getPostById(@Path("id") int id);

  @POST('/posts')
  void createPost(@Body() Post post);

  @POST('/login')
  Future<String> login(@Body() LoginRequest request);

  @GET('/role/check')
  Future<bool> checkRole();
}

Dio dio = Dio()
  ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    var token = await TokenStorageService().getToken();
    if (token != null) {
      options.headers['Authorization'] = "Bearer $token";
    }

    handler.next(options);
  }));

RestClient restClient = RestClient(dio);
