import 'package:arquitetura_pasta/app/core/mixin/loader_mixin.dart';
import 'package:arquitetura_pasta/app/core/mixin/messages_mixin.dart';
import 'package:arquitetura_pasta/app/modules/private/home/services/pessoa_service.dart';
import 'package:arquitetura_pasta/app/modules/private/home/viewModels/pessoa_view_model.dart';
import 'package:get/get.dart';

class PessoaController extends GetxController with LoaderMixin, MessagesMixin {
  final PessoaService _pessoaService;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  List<PessoaViewModel> _pessoaViewModel =
      List<PessoaViewModel>.empty(growable: true);
  List<PessoaViewModel> get pessoaViewModel => _pessoaViewModel;

  PessoaController({
    required PessoaService pessoaService,
  }) : _pessoaService = pessoaService;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  getAllPessoas() async {
    _loading.toggle();
    _pessoaViewModel = await _pessoaService.getAllPessoas();
    _loading.toggle();
    update();
  }
}
