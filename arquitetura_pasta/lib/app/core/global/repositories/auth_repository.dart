import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import 'abstract/auth_respository_abstract.dart';

class AuthRepository extends GetxService implements IAuthRepository {
  @override
  Future authenticationUser(
      {required String telefone,
      required String idToken,
      required String fcmToken}) {
    throw UnimplementedError();
  }
}
