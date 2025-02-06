import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final token = _getToken();
    // if (token != null) {
    //   if (!options.path.contains('login')) {
    //     options.headers['Authorization'] = 'Bearer ${token.bearer}';
    //   }
    // }
    // return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // final token = _getToken();
    // if (token != null) {
    //   if (err.response?.statusCode == 511) {
    //     final Response response = await dio.post(
    //       'token/refresh',
    //       data: {
    //         'refresh_token': token.refresh,
    //       },
    //     );
    //     final temp = Token(
    //       bearer: response.data['token'],
    //       refresh: response.data['refresh_token'],
    //     );
    //     await _saveToken(temp);
    //     err.requestOptions.headers['Authorization'] = 'Bearer ${temp.bearer}';
    //     return handler.resolve(await dio.fetch(err.requestOptions));
    //   }
    // }
    // return handler.next(err);
  }

  // Token? _getToken() {
  //   final temp =
  //       getIt<SharedPreferences>().getString(SharedPreferenceKey.token);
  //   if (temp != null) {
  //     return Token.fromJson(jsonDecode(temp));
  //   }
  //   return null;
  // }

  // Future<void> _saveToken(Token token) async {
  //   await getIt<SharedPreferences>()
  //       .setString(SharedPreferenceKey.token, jsonEncode(token.toJson()));
  // }
}
