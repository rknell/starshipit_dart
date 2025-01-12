import 'package:json_annotation/json_annotation.dart';
import 'update_order_request.dart';

part 'update_orders_bulk_request.g.dart';

/// Request wrapper for the Update Orders (bulk) endpoint
/// ```
/// Attribute   Type          Description
/// orders      object list   List of orders details (Update Order Model)
/// ```
@JsonSerializable()
class UpdateOrdersBulkRequest {
  /// Creates a new update orders bulk request instance
  UpdateOrdersBulkRequest({
    required this.orders,
  });

  /// Creates an UpdateOrdersBulkRequest from JSON
  factory UpdateOrdersBulkRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrdersBulkRequestFromJson(json);

  /// The list of orders to update
  final List<UpdateOrderRequest> orders;

  /// Converts the UpdateOrdersBulkRequest to JSON
  Map<String, dynamic> toJson() => _$UpdateOrdersBulkRequestToJson(this);
}
