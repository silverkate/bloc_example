import 'package:bloc_example/converter/joke_converter.dart';
import 'package:bloc_example/models/joke/joke_model.dart';
import 'package:dio/dio.dart';

/// Making requests with Dio and convert the response to the needed model.
class JokeApi {
  JokeApi();

  static const _api = 'https://official-joke-api.appspot.com/random_joke';

  final _dio = Dio();

  Future<JokeModel> getJoke() =>
      _dio.get(_api).then((value) => JokeConverter.fromJson(value.data));
}
