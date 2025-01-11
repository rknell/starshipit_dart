import 'package:json_annotation/json_annotation.dart';
import 'update_order_request.dart';

part 'update_orders_request.g.dart';

/// Request wrapper for the Update Order endpoint
/// ```
/// Attribute   Type    Description
/// order       object  The order details object (Update Order Model)
/// ```
@JsonSerializable()
class UpdateOrdersRequest {
  /// Creates a new update orders request instance
  UpdateOrdersRequest({
    required this.order,
  });

  /// The order details to update
  final UpdateOrderRequest order;

  /// Creates an UpdateOrdersRequest from JSON
  factory UpdateOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrdersRequestFromJson(json);

  /// Converts the UpdateOrdersRequest to JSON
  Map<String, dynamic> toJson() => _$UpdateOrdersRequestToJson(this);
}
