class ErroAvaliacaoAppException implements Exception {
  final String title;
  final String message;

  ErroAvaliacaoAppException(this.title, this.message) : super();

  @override
  String toString() =>
      'ErroAvaliacaoLojaException(title: $title, message: $message)';
}
