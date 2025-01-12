import 'package:json_annotation/json_annotation.dart';
import 'error.dart';

part 'delete_order_response.g.dart';

/// Response from the Delete Order endpoint
/// ```
/// Attribute   Type          Description
/// success     boolean       Determines whether the request was successfully submitted
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class DeleteOrderResponse {
  /// Creates a new delete order response instance
  DeleteOrderResponse({
    required this.success,
    this.errors,
  });

  /// Creates a DeleteOrderResponse from JSON
  factory DeleteOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteOrderResponseFromJson(json);

  /// Whether the request was successfully submitted
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Converts the DeleteOrderResponse to JSON
  Map<String, dynamic> toJson() => _$DeleteOrderResponseToJson(this);
}
