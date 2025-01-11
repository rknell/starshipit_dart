import 'package:json_annotation/json_annotation.dart';

part 'shipment.g.dart';

/// Represents a shipment in the StarShipIT system
@JsonSerializable()
class Shipment {
  /// Creates a new shipment
  Shipment({
    required this.orderNumber,
    required this.customerReference,
    this.status,
  });

  /// The order number for this shipment
  final String orderNumber;

  /// Customer reference number
  final String customerReference;

  /// Current status of the shipment
  final String? status;

  /// Creates a Shipment from JSON
  factory Shipment.fromJson(Map<String, dynamic> json) =>
      _$ShipmentFromJson(json);

  /// Converts the Shipment to JSON
  Map<String, dynamic> toJson() => _$ShipmentToJson(this);
}
