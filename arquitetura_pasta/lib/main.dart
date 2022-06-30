import 'package:arquitetura_pasta/app/modules/private/home/routers/pessoa_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/bindings/application_bindings.dart';

Future<void> main() async {
  runApp(const ProjetoPalestraMainApp());
}

class ProjetoPalestraMainApp extends StatelessWidget {
  const ProjetoPalestraMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Palestra',
      initialBinding: ApplicationBindings(),
      getPages: [...PessoaRouters.routers],
    );
  }
}
