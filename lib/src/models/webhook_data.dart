import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'webhook_data.g.dart';

/// Represents the data sent by StarShipIT in webhook notifications when tracking updates are received.
///
/// Webhooks are configured in the StarShipIT dashboard under Settings > Customer Notifications.
/// The endpoint URL must accept POST requests and return HTTP 200 OK.
///
/// Example use cases:
/// - Send order update emails to customers
/// - Update order status in your database
/// - Trigger fulfillment workflows
@JsonSerializable()
class WebhookData {
  /// Creates a new [WebhookData] instance
  const WebhookData({
    required this.orderNumber,
    required this.carrierName,
    required this.carrierService,
    required this.shipmentDate,
    required this.trackingNumber,
    required this.trackingStatus,
    required this.lastUpdatedDate,
  });

  /// Factory constructor for creating a [WebhookData] instance from JSON data
  factory WebhookData.fromJson(Map<String, dynamic> json) =>
      _$WebhookDataFromJson(json);

  /// The identifier of the order from the source eCommerce platform
  final String orderNumber;

  /// Name of the courier used for shipment delivery
  final String carrierName;

  /// Courier product service used for shipment delivery
  final String carrierService;

  /// The date when the label was generated for the shipment
  final DateTime shipmentDate;

  /// Courier tracking number
  final String trackingNumber;

  /// Last tracking status from the courier
  final TrackingStatus trackingStatus;

  /// Last tracking updated date from the courier
  final DateTime lastUpdatedDate;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => _$WebhookDataToJson(this);
}
