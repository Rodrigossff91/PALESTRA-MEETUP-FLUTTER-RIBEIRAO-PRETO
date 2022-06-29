import 'package:arquitetura_pasta/app/modules/private/home/bindings/pessoa_binding.dart';
import 'package:arquitetura_pasta/app/modules/private/home/screens/pessoa_page.dart';
import 'package:get/get.dart';

class PessoaRouters {
  PessoaRouters._();

  static final routers = <GetPage>[
    GetPage(
        name: '/pessoa',
        page: () => const PessoaPage(),
        binding: PessoaBinding()),
  ];
}
