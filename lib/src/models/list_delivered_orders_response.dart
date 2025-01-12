import 'package:json_annotation/json_annotation.dart';

import 'error.dart';
import 'full_order.dart';

part 'list_delivered_orders_response.g.dart';

/// Response from the List Delivered Orders endpoint
@JsonSerializable()
class ListDeliveredOrdersResponse {
  /// Creates a new list delivered orders response instance
  ListDeliveredOrdersResponse({
    required this.orders,
    required this.success,
    this.errors,
  });

  /// Creates a ListDeliveredOrdersResponse from JSON
  factory ListDeliveredOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDeliveredOrdersResponseFromJson(json);

  /// List of delivered orders details
  final List<FullOrder> orders;

  /// Whether the request was successful
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Converts the ListDeliveredOrdersResponse to JSON
  Map<String, dynamic> toJson() => _$ListDeliveredOrdersResponseToJson(this);
}
