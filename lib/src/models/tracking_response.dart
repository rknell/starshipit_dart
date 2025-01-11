import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'tracking_details.dart';

part 'tracking_response.g.dart';

/// Response model for tracking requests
@JsonSerializable()
class TrackingResponse {
  /// Creates a new [TrackingResponse] instance
  const TrackingResponse({
    required this.results,
    required this.success,
    this.errors,
  });

  /// Creates a [TrackingResponse] from JSON data
  factory TrackingResponse.fromJson(Map<String, dynamic> json) =>
      _$TrackingResponseFromJson(json);

  /// List of tracking details of the shipped orders
  final TrackingDetails results;

  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Converts this [TrackingResponse] into JSON data
  Map<String, dynamic> toJson() => _$TrackingResponseToJson(this);
}
