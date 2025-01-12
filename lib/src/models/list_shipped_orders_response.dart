import 'package:json_annotation/json_annotation.dart';

import 'error.dart';
import 'full_order.dart';

part 'list_shipped_orders_response.g.dart';

/// Response from the List Shipped Orders endpoint
@JsonSerializable()
class ListShippedOrdersResponse {
  /// Creates a new list shipped orders response instance
  ListShippedOrdersResponse({
    this.orders,
    this.orderIds,
    required this.totalPages,
    required this.success,
    this.errors,
  }) : assert(
          orders != null || orderIds != null,
          'Either orders or orderIds must be provided',
        );

  /// Creates a ListShippedOrdersResponse from JSON
  factory ListShippedOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListShippedOrdersResponseFromJson(json);

  /// List of shipped orders details
  final List<FullOrder>? orders;

  /// List of shipped order IDs (when ids_only is true)
  @JsonKey(name: 'order_ids')
  final List<int>? orderIds;

  /// Total number of pages available
  @JsonKey(name: 'total_pages')
  final int totalPages;

  /// Whether the request was successful
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Converts the ListShippedOrdersResponse to JSON
  Map<String, dynamic> toJson() => _$ListShippedOrdersResponseToJson(this);
}
