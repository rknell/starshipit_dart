import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

/// Represents an error response from the StarShipIT API
@JsonSerializable()
class StarShipItError {
  /// Creates a new error instance
  StarShipItError({
    required this.message,
    required this.details,
  });

  /// Creates a StarShipItError from JSON
  factory StarShipItError.fromJson(Map<String, dynamic> json) =>
      _$StarShipItErrorFromJson(json);

  /// The error message
  final String message;

  /// Detailed exception information
  final String details;

  /// Converts the StarShipItError to JSON
  Map<String, dynamic> toJson() => _$StarShipItErrorToJson(this);
}
