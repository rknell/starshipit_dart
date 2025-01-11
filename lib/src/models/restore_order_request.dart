import 'package:json_annotation/json_annotation.dart';

part 'restore_order_request.g.dart';

/// Request wrapper for the Restore Order endpoint
/// ```
/// Attribute   Type     Description
/// order_id   integer   The unique numeric identifier for the order
/// ```
@JsonSerializable()
class RestoreOrderRequest {
  /// Creates a new restore order request instance
  RestoreOrderRequest({
    required this.orderId,
  });

  /// The unique numeric identifier for the order
  @JsonKey(name: 'order_id')
  final int orderId;

  /// Creates a RestoreOrderRequest from JSON
  factory RestoreOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$RestoreOrderRequestFromJson(json);

  /// Converts the RestoreOrderRequest to JSON
  Map<String, dynamic> toJson() => _$RestoreOrderRequestToJson(this);

  /// Converts the request to query parameters
  Map<String, String> toQueryParameters() => {
        'order_id': orderId.toString(),
      };
}
