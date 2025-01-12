import 'package:json_annotation/json_annotation.dart';

part 'delete_order_request.g.dart';

/// Request wrapper for the Delete Order endpoint
/// ```
/// Attribute   Type     Description
/// order_id   integer   The unique numeric identifier for the order
/// ```
@JsonSerializable()
class DeleteOrderRequest {
  /// Creates a new delete order request instance
  DeleteOrderRequest({
    required this.orderId,
  });

  /// Creates a DeleteOrderRequest from JSON
  factory DeleteOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteOrderRequestFromJson(json);

  /// The unique numeric identifier for the order
  @JsonKey(name: 'order_id')
  final int orderId;

  /// Converts the DeleteOrderRequest to JSON
  Map<String, dynamic> toJson() => _$DeleteOrderRequestToJson(this);

  /// Converts the request to query parameters
  Map<String, String> toQueryParameters() => {
        'order_id': orderId.toString(),
      };
}
