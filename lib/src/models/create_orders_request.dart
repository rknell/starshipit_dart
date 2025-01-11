import 'package:json_annotation/json_annotation.dart';
import 'create_order_request.dart';

part 'create_orders_request.g.dart';

/// Request wrapper for the Create Order endpoint
/// ```
/// Attribute   Type    Description
/// order       object  The order details object (Create Order Model)
/// ```
@JsonSerializable()
class CreateOrdersRequest {
  /// Creates a new create orders request instance
  CreateOrdersRequest({
    required this.order,
  });

  /// The order details
  final CreateOrderRequest order;

  /// Creates a CreateOrdersRequest from JSON
  factory CreateOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrdersRequestFromJson(json);

  /// Converts the CreateOrdersRequest to JSON
  Map<String, dynamic> toJson() => _$CreateOrdersRequestToJson(this);
}
