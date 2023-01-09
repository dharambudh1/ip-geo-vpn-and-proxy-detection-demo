import "package:dio/dio.dart";
import "package:ipify_demo/model/error_response.dart";
import "package:ipify_demo/model/ip_geolocation_response.dart";
import "package:pretty_dio_logger/pretty_dio_logger.dart";

class DioSingleton {
  factory DioSingleton() {
    return _singleton;
  }

  DioSingleton._internal();

  static final DioSingleton _singleton = DioSingleton._internal();

  final Dio _dio = Dio();
  final String _baseURL = "https://geo.ipify.org/api/";
  final String _baseVer = "v2/";
  final String _baseEnd = "country,city,vpn";
  final String _apiKey = "at_pIV9DaKc0SF1pGllXyOszADp4S76M";

  Future<void> addPrettyDioLoggerInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(),
    );
    return Future<void>.value();
  }

  Future<IPGeolocationResponse> extractInformationFromIPAPI({
    required void Function(String) errorMessageFunction,
  }) async {
    IPGeolocationResponse ipResponse = IPGeolocationResponse();
    Response<dynamic> response = Response<dynamic>(
      requestOptions: RequestOptions(path: ""),
    );
    try {
      response = await _dio.get(
        _baseURL + _baseVer + _baseEnd,
        queryParameters: <String, dynamic>{
          "apiKey": _apiKey,
        },
        options: Options(
          headers: <String, dynamic>{
            "Content-Type": "application/json",
          },
        ),
      );
      ipResponse = IPGeolocationResponse.fromJson(response.data);
    } on DioError catch (error) {
      final ErrorResponse errRes = ErrorResponse.fromJson(error.response?.data);
      errorMessageFunction(errRes.messages ?? "Unknown Error");
    }
    return Future<IPGeolocationResponse>.value(ipResponse);
  }
}
