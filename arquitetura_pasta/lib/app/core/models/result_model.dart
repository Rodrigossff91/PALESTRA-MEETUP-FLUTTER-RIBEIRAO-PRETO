class PagedResult<T> {
  final bool? sucesso;
  final List<T>? resultado;

  PagedResult({this.sucesso, this.resultado});

  factory PagedResult.fromJson(Map<String, dynamic> json, Function fromJson) {
    final items = json['resultado'].cast<Map<String, dynamic>>();
    return PagedResult<T>(
        sucesso: json['sucesso'],
        resultado: List<T>.from(items.map((itemsJson) => fromJson(itemsJson))));
  }

  factory PagedResult.fromListJson(List items, Function fromJson) {
    return PagedResult<T>(
        resultado: List<T>.from(items.map((itemsJson) => fromJson(itemsJson))));
  }
}
