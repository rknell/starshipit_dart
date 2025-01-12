import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'full_order.dart';

part 'update_orders_bulk_response.g.dart';

/// Response from the Update Orders (bulk) endpoint
/// ```
/// Attribute   Type          Description
/// orders      object list   List of updated orders details (Full Order Model)
/// success     boolean       Determines whether the request was successful
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class UpdateOrdersBulkResponse {
  /// Creates a new update orders bulk response instance
  UpdateOrdersBulkResponse({
    required this.orders,
    required this.success,
    this.errors,
  });

  /// Creates an UpdateOrdersBulkResponse from JSON
  factory UpdateOrdersBulkResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrdersBulkResponseFromJson(json);

  /// The list of updated order details
  final List<FullOrder> orders;

  /// Whether the request was successful
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Converts the UpdateOrdersBulkResponse to JSON
  Map<String, dynamic> toJson() => _$UpdateOrdersBulkResponseToJson(this);
}
