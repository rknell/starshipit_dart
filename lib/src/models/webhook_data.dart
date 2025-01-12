import 'package:json_annotation/json_annotation.dart';
import 'tracking_status.dart';

part 'webhook_data.g.dart';

/// Represents the data received from a StarShipIt webhook
@JsonSerializable(explicitToJson: true)
class WebhookData {

  const WebhookData({
    required this.orderNumber,
    required this.carrierName,
    required this.carrierService,
    required this.shipmentDate,
    required this.trackingNumber,
    required this.trackingStatus,
    required this.lastUpdatedDate,
  });

  /// Creates a [WebhookData] instance from a JSON map
  factory WebhookData.fromJson(Map<String, dynamic> json) =>
      _$WebhookDataFromJson(json);
  /// The identifier of the order pulled from source eCommerce platform
  @JsonKey(name: 'order_number')
  final String orderNumber;

  /// Name of the courier used for shipment delivery
  @JsonKey(name: 'carrier_name')
  final String carrierName;

  /// Courier product service used for shipment delivery
  @JsonKey(name: 'carrier_service')
  final String carrierService;

  /// The date when the label was generated for the shipment
  @JsonKey(name: 'shipment_date')
  final DateTime shipmentDate;

  /// Courier tracking number
  @JsonKey(name: 'tracking_number')
  final String trackingNumber;

  /// Last tracking status from the courier
  @JsonKey(
    name: 'tracking_status',
    fromJson: _trackingStatusFromJson,
    toJson: _trackingStatusToJson,
  )
  final TrackingStatus trackingStatus;

  /// Last tracking updated date from the courier
  @JsonKey(name: 'last_updated_date')
  final DateTime lastUpdatedDate;

  /// Converts this [WebhookData] instance to a JSON map
  Map<String, dynamic> toJson() => _$WebhookDataToJson(this);

  static TrackingStatus _trackingStatusFromJson(String value) =>
      TrackingStatus.fromString(value);

  static String _trackingStatusToJson(TrackingStatus status) =>
      status.toString();
}
