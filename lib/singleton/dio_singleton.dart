import "package:dio/dio.dart";
import "package:ipify_demo/model/vpn_api_error_response.dart";
import "package:ipify_demo/model/vpn_api_success_response.dart";
import "package:pretty_dio_logger/pretty_dio_logger.dart";

class DioSingleton {
  factory DioSingleton() {
    return _singleton;
  }

  DioSingleton._internal();

  static final DioSingleton _singleton = DioSingleton._internal();

  final Dio _dio = Dio();

  Future<void> addPrettyDioLoggerInterceptor() {
    _dio.interceptors.add(PrettyDioLogger());
    return Future<void>.value();
  }

  final String _baseURL = "https://avpnapi.io/api/";
  final String _key = "40f6cdcbaf9b4c139d4a276b9788dee6";

  Future<VPNAPISuccessResponse> extractInformationFromIPAPI({
    required void Function(String) errorMessageFunction,
  }) async {
    VPNAPISuccessResponse vpnAPISuccessResponse = VPNAPISuccessResponse();
    try {
      final Response<dynamic> response = await _dio.get(
        _baseURL,
        queryParameters: <String, dynamic>{
          "key": _key,
        },
        options: Options(
          headers: <String, dynamic>{
            "Content-Type": "application/json",
          },
        ),
      );
      vpnAPISuccessResponse = VPNAPISuccessResponse.fromJson(response.data);
    } on DioError catch (error) {
      VPNAPIErrorResponse vpnAPIErrorResponse = VPNAPIErrorResponse();
      vpnAPIErrorResponse = VPNAPIErrorResponse.fromJson(error.response?.data);
      errorMessageFunction(vpnAPIErrorResponse.message ?? "Unknown Error");
    }
    return Future<VPNAPISuccessResponse>.value(vpnAPISuccessResponse);
  }
}
