import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'full_order.dart';

part 'list_unshipped_orders_response.g.dart';

/// API Field Structure:
/// ```
/// Attribute     Type                Description
/// orders        list of orders      List of unshipped orders details (Full Order Model)
/// order_ids     list of order_ids   List of unshipped order_ids (only present if ids_only is true)
/// total_pages   integer            Total number of pages available
/// success       boolean            Determines whether the request was successfully submitted
/// errors        object list        List of detailed errors (Error Model) (only present if request failed)
/// ```
@JsonSerializable()
class ListUnshippedOrdersResponse {
  /// Creates a new list unshipped orders response instance
  ListUnshippedOrdersResponse({
    this.orders,
    this.orderIds,
    required this.totalPages,
    required this.success,
    this.errors,
  }) : assert(
          orders != null || orderIds != null,
          'Either orders or orderIds must be provided',
        );

  /// List of unshipped orders details (Full Order Model)
  /// Only present when ids_only is false
  final List<FullOrder>? orders;

  /// List of unshipped order IDs
  /// Only present when ids_only is true
  @JsonKey(name: 'order_ids')
  final List<int>? orderIds;

  /// Total number of pages available
  @JsonKey(name: 'total_pages')
  final int totalPages;

  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors (Error Model)
  /// Only present if the request resulted in an error
  final List<StarShipItError>? errors;

  /// Creates a ListUnshippedOrdersResponse from JSON
  factory ListUnshippedOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUnshippedOrdersResponseFromJson(json);

  /// Converts the ListUnshippedOrdersResponse to JSON
  Map<String, dynamic> toJson() => _$ListUnshippedOrdersResponseToJson(this);
}
