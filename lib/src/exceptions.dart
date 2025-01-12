/// Base exception class for StarShipIT API errors
class StarShipItException implements Exception {
  /// Creates a new StarShipIT exception
  StarShipItException(this.message);

  /// The error message
  final String message;

  @override
  String toString() => 'StarShipItException: $message';
}

/// Thrown when authentication fails
class StarShipItAuthException extends StarShipItException {
  /// Creates a new authentication exception
  StarShipItAuthException([super.message = 'Authentication failed']);
}
