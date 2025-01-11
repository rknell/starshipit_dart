import 'package:json_annotation/json_annotation.dart';
import 'carrier.dart';

part 'shipments_order.g.dart';

/// API Field Structure:
/// ```
/// Attribute             Type          Description
/// order_id             integer       The unique numeric identifier for the order
/// order_number         string        The identifier of the order pulled from source e-Commerce platform
/// date                 string        The date and time when the order was printed in UTC (RFC3339)
/// name                 string        Contact name of the receiver
/// carrier_name         string        The carrier that used in the order
/// carrier_service_code string        Carrier service code for delivery
/// tracking_numbers     string list   Carrier tracking numbers
/// country             string        The country name of delivery address
/// ```
@JsonSerializable()
class ShipmentsOrder {
  /// Creates a new shipments order instance
  ShipmentsOrder({
    required this.orderId,
    required this.orderNumber,
    required this.date,
    required this.name,
    required this.carrierName,
    required this.carrierServiceCode,
    required this.trackingNumbers,
    required this.country,
  });

  /// The unique numeric identifier for the order
  @JsonKey(name: 'order_id')
  final int orderId;

  /// The identifier of the order pulled from source e-Commerce platform
  @JsonKey(name: 'order_number')
  final String orderNumber;

  /// The date and time when the order was printed in UTC (RFC3339 format)
  final String date;

  /// Contact name of the receiver
  final String name;

  /// The carrier that used in the order
  @JsonKey(name: 'carrier_name')
  final String carrierName;

  /// Carrier service code for delivery
  @JsonKey(name: 'carrier_service_code')
  final String carrierServiceCode;

  /// Carrier tracking numbers
  @JsonKey(name: 'tracking_numbers')
  final List<String> trackingNumbers;

  /// The country name of delivery address
  final String country;

  /// Creates a ShipmentsOrder from JSON
  factory ShipmentsOrder.fromJson(Map<String, dynamic> json) =>
      _$ShipmentsOrderFromJson(json);

  /// Converts the ShipmentsOrder to JSON
  Map<String, dynamic> toJson() => _$ShipmentsOrderToJson(this);
}
