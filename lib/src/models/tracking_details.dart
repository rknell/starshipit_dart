import 'package:json_annotation/json_annotation.dart';
import 'tracking_event.dart';

part 'tracking_details.g.dart';

/// Model for tracking details of a shipped order
@JsonSerializable()
class TrackingDetails {

  /// Creates a new [TrackingDetails] instance
  const TrackingDetails({
    required this.orderNumber,
    required this.orderStatus,
    required this.carrierName,
    required this.carrierService,
    required this.trackingNumber,
    required this.trackingUrl,
    required this.shipmentDate,
    required this.trackingStatus,
    required this.lastUpdatedDate,
    required this.trackingEvents,
  });

  /// Creates a [TrackingDetails] from JSON data
  factory TrackingDetails.fromJson(Map<String, dynamic> json) =>
      _$TrackingDetailsFromJson(json);
  /// The identifier of the order pulled from source e-Commerce platform
  final String orderNumber;

  /// The status of the order (e.g. Unshipped, Awaiting Dispatch, Dispatched and Delivered)
  final String orderStatus;

  /// Name of the carrier used for shipment delivery
  final String carrierName;

  /// Carrier product service used for shipment delivery
  final String carrierService;

  /// Carrier tracking number
  final String trackingNumber;

  /// Carrier tracking URL
  final String trackingUrl;

  /// The date when shipment was picked up
  final DateTime shipmentDate;

  /// Last tracking status from the carrier
  final String trackingStatus;

  /// Last tracking updated date from the carrier
  final DateTime lastUpdatedDate;

  /// List of detailed tracking events from the carrier
  final List<TrackingEvent> trackingEvents;

  /// Converts this [TrackingDetails] into JSON data
  Map<String, dynamic> toJson() => _$TrackingDetailsToJson(this);
}
