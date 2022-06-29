import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../config/config.dart';
import '../appClient/app_client.dart';
import '../global/controllers/auth_controller.dart';
import '../global/repositories/auth_repository.dart';
import '../global/services/auth_service_abstract.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiClient>(() => ApiClient(URLAPI, Dio(), false));
    Get.put(AuthRepository());
    Get.put(AuthService());
    Get.put(AuthController(), permanent: true);
  }
}
