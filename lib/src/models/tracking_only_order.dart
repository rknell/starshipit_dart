import 'package:json_annotation/json_annotation.dart';
import 'carrier.dart';

part 'tracking_only_order.g.dart';

/// Represents a tracking-only order for external shipments
@JsonSerializable(explicitToJson: true)
class TrackingOnlyOrder {
  /// The name of the customer (optional)
  final String? name;

  /// Reference number for the order (optional)
  @JsonKey(name: 'order_number')
  final String? orderNumber;

  /// The carrier this order was shipped with
  @JsonKey(
    fromJson: _carrierFromJson,
    toJson: _carrierToJson,
  )
  final Carrier carrier;

  /// The tracking number for the shipment
  @JsonKey(name: 'tracking_number')
  final String trackingNumber;

  /// The country name
  final String country;

  /// The destination postcode
  final String postcode;

  const TrackingOnlyOrder({
    this.name,
    this.orderNumber,
    required this.carrier,
    required this.trackingNumber,
    required this.country,
    required this.postcode,
  });

  /// Creates a [TrackingOnlyOrder] from JSON map
  factory TrackingOnlyOrder.fromJson(Map<String, dynamic> json) =>
      _$TrackingOnlyOrderFromJson(json);

  /// Converts this [TrackingOnlyOrder] to a JSON map
  Map<String, dynamic> toJson() => _$TrackingOnlyOrderToJson(this);

  static Carrier _carrierFromJson(String value) => Carrier.values.firstWhere(
        (carrier) => carrier.toString().split('.').last == value,
        orElse: () => throw ArgumentError('Invalid carrier name: $value'),
      );

  static String _carrierToJson(Carrier carrier) =>
      carrier.toString().split('.').last;
}
