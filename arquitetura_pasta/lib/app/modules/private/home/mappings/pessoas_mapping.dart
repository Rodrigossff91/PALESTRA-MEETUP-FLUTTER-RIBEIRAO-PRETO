import 'package:arquitetura_pasta/app/modules/private/home/models/pessoa_model.dart';
import 'package:arquitetura_pasta/app/modules/private/home/viewModels/pessoa_view_model.dart';

extension PessoaMapping on PessoaModel {
  PessoaViewModel toViewModel() {
    var endereco = enderecos?.map((e) => e.toViewModel()).toList();

    return PessoaViewModel(
      nome: nome as String,
      telefone: telefone as String,
      enderecos: endereco,
    );
  }
}

extension EnderecoMapping on EnderecoModel {
  EnderecoViewModel toViewModel() {
    return EnderecoViewModel(
        bairro: bairro, cep: cep, cidade: cidade, numero: numero, rua: rua);
  }
}
