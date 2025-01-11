import 'package:json_annotation/json_annotation.dart';

part 'search_order.g.dart';

/// API Field Structure:
/// ```
/// Attribute        Type      Description
/// order_id        integer   The unique numeric identifier for the order
/// order_date      string    The date when the order was created in UTC (RFC3339)
/// order_number    string    The identifier of the order pulled from source e-Commerce platform
/// name            string    Contact name of the receiver
/// carrier_name    string    The carrier that used in the order
/// tracking_number string    Carrier tracking number
/// country         string    The country name of delivery address
/// ```
@JsonSerializable()
class SearchOrder {
  /// Creates a new search order instance
  SearchOrder({
    required this.orderId,
    required this.orderDate,
    required this.orderNumber,
    required this.name,
    required this.carrierName,
    required this.trackingNumber,
    required this.country,
  });

  /// The unique numeric identifier for the order
  @JsonKey(name: 'order_id')
  final int orderId;

  /// The date when the order was created in UTC (RFC3339 format)
  @JsonKey(name: 'order_date')
  final String orderDate;

  /// The identifier of the order pulled from source e-Commerce platform
  @JsonKey(name: 'order_number')
  final String orderNumber;

  /// Contact name of the receiver
  final String name;

  /// The carrier that used in the order
  @JsonKey(name: 'carrier_name')
  final String carrierName;

  /// Carrier tracking number
  @JsonKey(name: 'tracking_number')
  final String trackingNumber;

  /// The country name of delivery address
  final String country;

  /// Creates a SearchOrder from JSON
  factory SearchOrder.fromJson(Map<String, dynamic> json) =>
      _$SearchOrderFromJson(json);

  /// Converts the SearchOrder to JSON
  Map<String, dynamic> toJson() => _$SearchOrderToJson(this);
}
