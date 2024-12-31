import 'package:emend_web_app/Model/UserModel/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> registerApi(name, email);
  Future<UserModel> loginApi(token, email);
}
