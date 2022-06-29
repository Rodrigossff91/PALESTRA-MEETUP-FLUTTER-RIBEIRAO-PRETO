import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../config/config.dart';
import '../appClient/app_client.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiClient>(() => ApiClient(URLAPI, Dio(), false));
    //  Get.put(WidgetBottomNavigationBarController());
    // Get.put(AuthRepository());
    //  Get.put(ServicoRepository());
    //   Get.put(ServicoService());
    //  Get.put(AuthController(), permanent: true);
    //  Get.put(ServicoController(), permanent: true);
  }
}
