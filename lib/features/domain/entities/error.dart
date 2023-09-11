final class CatchError implements Exception {
  String message;

  CatchError({required this.message});
}

final class NetworkError extends Error {}
