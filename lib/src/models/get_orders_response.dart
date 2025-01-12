import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'full_order.dart';

part 'get_orders_response.g.dart';

/// Response from the Get Orders endpoint
/// ```
/// Attribute   Type          Description
/// order       object list   List of order details (Full Order Model)
/// success     boolean       Determines whether the request was successful
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class GetOrdersResponse {
  /// Creates a new get orders response instance
  GetOrdersResponse({
    required this.order,
    required this.success,
    this.errors,
  });

  /// Creates a GetOrdersResponse from JSON
  factory GetOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersResponseFromJson(json);

  /// List of order details
  final List<FullOrder> order;

  /// Whether the request was successful
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Converts the GetOrdersResponse to JSON
  Map<String, dynamic> toJson() => _$GetOrdersResponseToJson(this);
}
