import 'package:arquitetura_pasta/app/modules/private/home/models/pessoa_model.dart';

abstract class IPessoaRepository {
  Future<List<PessoaModel>> getAllPessoas();
}
