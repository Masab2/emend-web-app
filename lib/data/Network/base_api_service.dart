abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url, dynamic headers);

  Future<dynamic> getPostApiResponse(String url, dynamic data, dynamic headers);

  Future<dynamic> getDeleteApiResponse(
      String url, dynamic data, dynamic headers);

  Future<dynamic> getPutApiResponse(String url, dynamic data, dynamic headers);
}
