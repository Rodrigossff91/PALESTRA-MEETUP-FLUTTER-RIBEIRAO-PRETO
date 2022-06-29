import '../../viewModels/pessoa_view_model.dart';

abstract class IPessoaService {
  Future<List<PessoaViewModel>> getAllPessoas();
}
