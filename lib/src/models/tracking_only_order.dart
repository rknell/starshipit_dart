import 'package:json_annotation/json_annotation.dart';
import 'carrier.dart';

part 'tracking_only_order.g.dart';

/// Model representing an order that was created and shipped outside of StarShipIT
/// but needs to be tracked in the StarShipIT system.
@JsonSerializable()
class TrackingOnlyOrder {
  /// Creates a new [TrackingOnlyOrder] instance
  const TrackingOnlyOrder({
    this.name,
    this.orderNumber,
    required this.carrier,
    required this.trackingNumber,
    required this.country,
    required this.postcode,
  });

  /// Factory constructor for creating a [TrackingOnlyOrder] instance from JSON data
  factory TrackingOnlyOrder.fromJson(Map<String, dynamic> json) =>
      _$TrackingOnlyOrderFromJson(json);

  /// The name of the customer
  final String? name;

  /// Reference number for the order
  final String? orderNumber;

  /// The carrier this order was shipped with
  final Carrier carrier;

  /// The tracking number for the shipment
  final String trackingNumber;

  /// The destination country name
  final String country;

  /// The destination postcode
  final String postcode;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => _$TrackingOnlyOrderToJson(this);
}
