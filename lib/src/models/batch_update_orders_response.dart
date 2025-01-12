import 'package:json_annotation/json_annotation.dart';
import 'error.dart';

part 'batch_update_orders_response.g.dart';

/// Response from the Batch Update Orders endpoint
/// ```
/// Attribute   Type          Description
/// success     boolean       Determines whether the request was successfully submitted
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class BatchUpdateOrdersResponse {
  /// Creates a new batch update orders response instance
  BatchUpdateOrdersResponse({
    required this.success,
    this.errors,
  });

  /// Creates a BatchUpdateOrdersResponse from JSON
  factory BatchUpdateOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchUpdateOrdersResponseFromJson(json);

  /// Whether the request was successfully submitted
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Converts the BatchUpdateOrdersResponse to JSON
  Map<String, dynamic> toJson() => _$BatchUpdateOrdersResponseToJson(this);
}
