import 'package:arquitetura_pasta/app/modules/private/home/controllers/pessoa_controller.dart';
import 'package:arquitetura_pasta/app/modules/private/home/repositories/abstract/pessoa_respository_abstract.dart';
import 'package:arquitetura_pasta/app/modules/private/home/repositories/pessoa_respository.dart';
import 'package:arquitetura_pasta/app/modules/private/home/services/abstract/pessoa_service_abstract.dart';
import 'package:arquitetura_pasta/app/modules/private/home/services/pessoa_service.dart';
import 'package:get/get.dart';

class PessoaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPessoaRepository>(() => PessoaRepository(client: Get.find()));
    Get.lazyPut<IPessoaService>(
        () => PessoaService(pessoaRepository: Get.find()));
    Get.put(PessoaController(pessoaService: Get.find()));
  }
}
