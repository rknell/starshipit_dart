import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'full_order.dart';

part 'create_orders_response.g.dart';

/// Response from the Create Order endpoint
/// ```
/// Attribute   Type          Description
/// order       object        Created orders details (Full Order Model)
/// success     boolean       Determines whether the request was successful
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class CreateOrdersResponse {
  /// Creates a new create orders response instance
  CreateOrdersResponse({
    required this.order,
    required this.success,
    this.errors,
  });

  /// Creates a CreateOrdersResponse from JSON
  factory CreateOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrdersResponseFromJson(json);

  /// The created order details
  final FullOrder? order;

  /// Whether the request was successful
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Converts the CreateOrdersResponse to JSON
  Map<String, dynamic> toJson() => _$CreateOrdersResponseToJson(this);
}
