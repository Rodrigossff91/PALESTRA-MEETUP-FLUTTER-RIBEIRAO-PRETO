import 'package:get/get.dart';

import 'abstract/auth_service_abstract.dart';

class AuthService extends GetxService implements IAuthService {
  @override
  Future authenticationUser(
      {required String telefone,
      required String idToken,
      required String fcmToken}) {
    throw UnimplementedError();
  }
}
