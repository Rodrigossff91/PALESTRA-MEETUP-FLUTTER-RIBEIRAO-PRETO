import 'package:get/get.dart';

class WidgetBottomNavigationBarController extends GetxController {
  final iconHome = true.obs;

  final iconRecados = false.obs;

  final iconFinanceiro = false.obs;

  final iconFoto = false.obs;

  final _titleMenu = "".obs;

  @override
  void onInit() {
    change();
    super.onInit();
  }

  set selectedMenu(String title) => _titleMenu.value = title;

  change() {
    ever<String?>(_titleMenu, (value) {
      if (value == "Inicio") {
        iconHome.value = true;
        iconRecados.value = false;
        iconFinanceiro.value = false;
        iconFoto.value = false;
        update();
      } else if (value == "Recados") {
        iconRecados.value = true;
        iconFinanceiro.value = false;
        iconFoto.value = false;
        iconHome.value = false;
        update();
      } else if (value == "Financeiro") {
        iconFinanceiro.value = true;
        iconFoto.value = false;
        iconHome.value = false;
        iconRecados.value = false;
        update();
      } else if (value == "Fotos") {
        iconFoto.value = true;
        iconHome.value = false;
        iconRecados.value = false;
        iconFinanceiro.value = false;
        update();
      }
    });
  }
}
