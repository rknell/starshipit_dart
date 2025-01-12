import 'package:json_annotation/json_annotation.dart';
import 'error.dart';

part 'restore_order_response.g.dart';

/// Response from the Restore Order endpoint
/// ```
/// Attribute   Type          Description
/// success     boolean       Determines whether the request was successfully submitted
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class RestoreOrderResponse {
  /// Creates a new restore order response instance
  RestoreOrderResponse({
    required this.success,
    this.errors,
  });

  /// Creates a RestoreOrderResponse from JSON
  factory RestoreOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$RestoreOrderResponseFromJson(json);

  /// Whether the request was successfully submitted
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Converts the RestoreOrderResponse to JSON
  Map<String, dynamic> toJson() => _$RestoreOrderResponseToJson(this);
}
