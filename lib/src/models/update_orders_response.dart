import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'full_order.dart';

part 'update_orders_response.g.dart';

/// Response from the Update Order endpoint
/// ```
/// Attribute   Type          Description
/// order       object        Updated orders details (Full Order Model)
/// success     boolean       Determines whether the request was successful
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class UpdateOrdersResponse {
  /// Creates a new update orders response instance
  UpdateOrdersResponse({
    required this.order,
    required this.success,
    this.errors,
  });

  /// The updated order details
  final FullOrder order;

  /// Whether the request was successful
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Creates an UpdateOrdersResponse from JSON
  factory UpdateOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrdersResponseFromJson(json);

  /// Converts the UpdateOrdersResponse to JSON
  Map<String, dynamic> toJson() => _$UpdateOrdersResponseToJson(this);
}
