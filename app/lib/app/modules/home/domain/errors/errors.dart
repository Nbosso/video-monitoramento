class GetUrlException implements Exception {
  final String message;

  GetUrlException(this.message);

  @override
  String toString() => message;
}