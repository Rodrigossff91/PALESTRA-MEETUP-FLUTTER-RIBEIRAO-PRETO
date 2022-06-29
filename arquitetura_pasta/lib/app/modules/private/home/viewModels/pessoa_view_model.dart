class PessoaViewModel {
  String? id;
  String nome;
  String? sobrenome;
  String telefone;
  List<EnderecoViewModel>? enderecos;
  PessoaViewModel({
    this.id,
    required this.nome,
    this.sobrenome,
    required this.telefone,
    this.enderecos,
  });
}

class EnderecoViewModel {
  String rua;
  String bairro;
  int numero;
  String cidade;
  String cep;
  EnderecoViewModel({
    required this.rua,
    required this.bairro,
    required this.numero,
    required this.cidade,
    required this.cep,
  });
}
