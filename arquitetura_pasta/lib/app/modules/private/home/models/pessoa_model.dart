import 'dart:convert';

class PessoaModel {
  final String? id;
  final String? nome;
  final String? sobrenome;
  final String? telefone;
  final List<EnderecoModel>? enderecos;
  PessoaModel(
    this.id,
    this.nome,
    this.sobrenome,
    this.telefone,
    this.enderecos,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'telefone': telefone,
      'enderecos': enderecos?.map((x) => x.toMap()).toList(),
    };
  }

  factory PessoaModel.fromMap(Map<String, dynamic> map) {
    return PessoaModel(
      map['id'],
      map['nome'],
      map['sobrenome'],
      map['telefone'],
      map['enderecos'] != null
          ? List<EnderecoModel>.from(
              map['enderecos']?.map((x) => EnderecoModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PessoaModel.fromJson(String source) =>
      PessoaModel.fromMap(json.decode(source));
}

class EnderecoModel {
  final String rua;
  final String bairro;
  final int numero;
  final String cidade;
  final String cep;
  EnderecoModel({
    required this.rua,
    required this.bairro,
    required this.numero,
    required this.cidade,
    required this.cep,
  });

  Map<String, dynamic> toMap() {
    return {
      'rua': rua,
      'bairro': bairro,
      'numero': numero,
      'cidade': cidade,
      'cep': cep,
    };
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      rua: map['rua'] ?? '',
      bairro: map['bairro'] ?? '',
      numero: map['numero']?.toInt() ?? 0,
      cidade: map['cidade'] ?? '',
      cep: map['cep'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EnderecoModel.fromJson(String source) =>
      EnderecoModel.fromMap(json.decode(source));
}
