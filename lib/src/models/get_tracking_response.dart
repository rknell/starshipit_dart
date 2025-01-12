import 'package:json_annotation/json_annotation.dart';

part 'get_tracking_response.g.dart';

/// Response model for tracking API requests
@JsonSerializable()
class GetTrackingResponse {
  /// Creates a new [GetTrackingResponse] instance
  const GetTrackingResponse({
    required this.results,
    required this.success,
    this.errors,
  });

  /// Factory constructor for creating a [GetTrackingResponse] instance from JSON data
  factory GetTrackingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTrackingResponseFromJson(json);

  /// The tracking results containing order and tracking details
  final TrackingResult results;

  /// Whether the request was successful
  final bool success;

  /// List of errors if the request failed
  final List<String>? errors;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => _$GetTrackingResponseToJson(this);
}

/// Detailed tracking information for an order
@JsonSerializable()
class TrackingResult {
  /// Creates a new [TrackingResult] instance
  const TrackingResult({
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

  /// Factory constructor for creating a [TrackingResult] instance from JSON data
  factory TrackingResult.fromJson(Map<String, dynamic> json) =>
      _$TrackingResultFromJson(json);

  /// The identifier of the order from the source e-commerce platform
  final String orderNumber;

  /// The current status of the order (e.g. Unshipped, Awaiting Dispatch, Dispatched, Delivered)
  final String orderStatus;

  /// Name of the carrier handling the shipment
  final String carrierName;

  /// The carrier's service product code used for delivery
  final String carrierService;

  /// The carrier's tracking number for the shipment
  final String trackingNumber;

  /// URL to track the shipment on the carrier's website
  final String trackingUrl;

  /// The date when the shipment was picked up
  final DateTime shipmentDate;

  /// Latest tracking status from the carrier
  final String trackingStatus;

  /// Timestamp of the last tracking update
  final DateTime lastUpdatedDate;

  /// List of tracking events showing shipment progress
  final List<TrackingEvent> trackingEvents;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => _$TrackingResultToJson(this);
}

/// A tracking event representing a status update in the shipment's journey
@JsonSerializable()
class TrackingEvent {
  /// Creates a new [TrackingEvent] instance
  const TrackingEvent({
    required this.eventDatetime,
    required this.status,
    required this.details,
  });

  /// Factory constructor for creating a [TrackingEvent] instance from JSON data
  factory TrackingEvent.fromJson(Map<String, dynamic> json) =>
      _$TrackingEventFromJson(json);

  /// The date and time when the event occurred
  final DateTime eventDatetime;

  /// The status code or description for this event
  final String status;

  /// Detailed description of what happened in this event
  final String details;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => _$TrackingEventToJson(this);
}
