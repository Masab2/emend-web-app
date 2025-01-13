import 'package:emend_web_app/Model/UserModel/user_model.dart';
import 'package:emend_web_app/Repository/AuthRepo/auth_repo.dart';
import 'package:emend_web_app/config/AppUrl/app_url.dart';
import 'package:emend_web_app/data/Network/network_api_service.dart';

class AuthRepoHttpRepo implements AuthRepo {
  final _api = NetworkApiService();
  @override
  Future<UserModel> loginApi(token, email) async {
    final response = await _api.getPostApiResponse(
      AppUrl.login(token),
      {
        "email": email,
      },
      {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> registerApi(email) async {
    final response = await _api.getPostApiResponse(
      AppUrl.register,
      {
        "email": email,
      },
      {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    return UserModel.fromJson(response);
  }
}
