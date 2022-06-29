import 'package:arquitetura_pasta/app/modules/private/home/mappings/pessoas_mapping.dart';
import 'package:arquitetura_pasta/app/modules/private/home/repositories/pessoa_respository.dart';
import 'package:arquitetura_pasta/app/modules/private/home/services/abstract/pessoa_service_abstract.dart';
import 'package:arquitetura_pasta/app/modules/private/home/viewModels/pessoa_view_model.dart';
import 'package:get/get.dart';

class PessoaService extends GetxService implements IPessoaService {
  final PessoaRepository _pessoaRepository;
  PessoaService({
    required PessoaRepository pessoaRepository,
  }) : _pessoaRepository = pessoaRepository;

  @override
  Future<List<PessoaViewModel>> getAllPessoas() async {
    // Aqui poderia haver alguma regra

    var pessoas = await _pessoaRepository.getAllPessoas();

    return pessoas.map((e) => e.toViewModel()).toList();
  }
}
