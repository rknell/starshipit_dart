import 'package:json_annotation/json_annotation.dart';

part 'batch_update_orders_request.g.dart';

/// Request wrapper for the Batch Update Orders endpoint
/// ```
/// Attribute     Type          Description
/// order_ids     integer list  List of order_id to be updated
/// product_code  string        Carrier service code for delivery
/// carrier_id    string        The id of the carrier that is used in the order
/// ```
@JsonSerializable()
class BatchUpdateOrdersRequest {
  /// Creates a new batch update orders request instance
  BatchUpdateOrdersRequest({
    required this.orderIds,
    required this.productCode,
    required this.carrierId,
  });

  /// Creates a BatchUpdateOrdersRequest from JSON
  factory BatchUpdateOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchUpdateOrdersRequestFromJson(json);

  /// List of order IDs to be updated
  @JsonKey(name: 'order_ids')
  final List<int> orderIds;

  /// Carrier service code for delivery
  @JsonKey(name: 'product_code')
  final String productCode;

  /// The ID of the carrier to be used in the order
  @JsonKey(name: 'carrier_id')
  final String carrierId;

  /// Converts the BatchUpdateOrdersRequest to JSON
  Map<String, dynamic> toJson() => _$BatchUpdateOrdersRequestToJson(this);
}
