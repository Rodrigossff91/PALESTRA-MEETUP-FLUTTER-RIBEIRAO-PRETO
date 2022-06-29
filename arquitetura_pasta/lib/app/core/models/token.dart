class Token {
  bool? authenticated;
  String? accessToken;
  int? expiresIn;
  UsuarioToken? usuarioToken;

  Token(
      {this.authenticated,
      this.accessToken,
      this.expiresIn,
      this.usuarioToken});

  Token.fromJson(Map<String, dynamic> json) {
    authenticated = json['authenticated'];
    accessToken = json['accessToken'];
    expiresIn = json['expiresIn'];
    usuarioToken = json['usuarioToken'] != null
        ? UsuarioToken.fromJson(json['usuarioToken'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authenticated'] = authenticated;
    data['accessToken'] = accessToken;
    data['expiresIn'] = expiresIn;
    if (usuarioToken != null) {
      data['usuarioToken'] = usuarioToken!.toJson();
    }
    return data;
  }
}

class UsuarioToken {
  String? id;
  String? email;
  String? nome;
  List<Claims>? claims;

  UsuarioToken({this.id, this.email, this.nome, this.claims});

  UsuarioToken.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nome = json['nome'];
    if (json['claims'] != null) {
      claims = List<Claims>.empty();
      json['claims'].forEach((v) {
        claims!.add(Claims.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['nome'] = nome;

    if (claims != null) {
      data['claims'] = claims!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Claims {
  String? value;
  String? type;

  Claims({this.value, this.type});

  Claims.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['type'] = type;
    return data;
  }
}
