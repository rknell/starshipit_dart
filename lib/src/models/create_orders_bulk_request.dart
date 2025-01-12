import 'package:json_annotation/json_annotation.dart';
import 'create_order_model.dart';

part 'create_orders_bulk_request.g.dart';

/// Request wrapper for the Create Orders (bulk) endpoint
/// ```
/// Attribute   Type          Description
/// orders      object list   List of orders details (Create Order Model)
/// ```
@JsonSerializable()
class CreateOrdersBulkRequest {
  /// Creates a new create orders bulk request instance
  CreateOrdersBulkRequest({
    required this.orders,
  }) : assert(
          orders.length <= 50,
          'Maximum orders per API request: 50',
        );

  /// The list of orders to create
  final List<CreateOrderModel> orders;

  /// Creates a CreateOrdersBulkRequest from JSON
  factory CreateOrdersBulkRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrdersBulkRequestFromJson(json);

  /// Converts the CreateOrdersBulkRequest to JSON
  Map<String, dynamic> toJson() => _$CreateOrdersBulkRequestToJson(this);
}
