import 'package:json_annotation/json_annotation.dart';

part 'tracking_event.g.dart';

/// Model for a carrier tracking event
@JsonSerializable()
class TrackingEvent {
  /// Date and time of the carrier scan or event
  final DateTime eventDatetime;

  /// Status of the event
  final String status;

  /// Description of the event
  final String details;

  /// Creates a new [TrackingEvent] instance
  const TrackingEvent({
    required this.eventDatetime,
    required this.status,
    required this.details,
  });

  /// Creates a [TrackingEvent] from JSON data
  factory TrackingEvent.fromJson(Map<String, dynamic> json) =>
      _$TrackingEventFromJson(json);

  /// Converts this [TrackingEvent] into JSON data
  Map<String, dynamic> toJson() => _$TrackingEventToJson(this);
}
