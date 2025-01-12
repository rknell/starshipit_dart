import 'package:json_annotation/json_annotation.dart';

import 'error.dart';
import 'shipments_order.dart';

part 'list_shipments_response.g.dart';

/// Response from the List Shipments endpoint
@JsonSerializable()
class ListShipmentsResponse {
  /// Creates a new list shipments response instance
  ListShipmentsResponse({
    required this.status,
    this.orders,
    required this.totalPages,
    required this.success,
    this.errors,
  });

  /// Creates a ListShipmentsResponse from JSON
  factory ListShipmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListShipmentsResponseFromJson(json);

  /// The status of the shipments returned
  @JsonKey(name: 'status')
  final String status;

  /// List of orders matching the request criteria
  final List<ShipmentsOrder>? orders;

  /// Total number of pages available
  @JsonKey(name: 'total_pages')
  final int totalPages;

  /// Whether the request was successful
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Converts the ListShipmentsResponse to JSON
  Map<String, dynamic> toJson() => _$ListShipmentsResponseToJson(this);
}
