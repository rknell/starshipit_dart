import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

/// API Field Structure:
/// ```
/// Attribute     Type        Description
/// time         datetime    The timestamp when the event occurred
/// category     string      The category of the event
/// name         string      The name of the event
/// method       string      The method associated with the event
/// description  string      A detailed description of the event
/// ```
@JsonSerializable()
class Event {
  /// Creates a new event instance
  Event({
    required this.time,
    required this.category,
    required this.name,
    required this.method,
    required this.description,
  });

  /// Creates an Event from JSON
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  /// The timestamp when the event occurred
  final DateTime time;

  /// The category of the event
  final String category;

  /// The name of the event
  final String name;

  /// The method associated with the event
  final String method;

  /// A detailed description of the event
  final String description;

  /// Converts the Event to JSON
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
