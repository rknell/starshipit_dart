import 'package:json_annotation/json_annotation.dart';

part 'create_tracking_only_orders_response.g.dart';

/// Response model for creating tracking-only orders in StarShipIT.
///
/// Contains a map of created orders where:
/// - Key: The order number assigned by StarShipIT
/// - Value: The tracking number for the order
@JsonSerializable()
class CreateTrackingOnlyOrdersResponse {
  /// Creates a new [CreateTrackingOnlyOrdersResponse] instance
  const CreateTrackingOnlyOrdersResponse({
    required this.orders,
    required this.success,
  });

  /// Factory constructor for creating a [CreateTrackingOnlyOrdersResponse] instance from JSON data
  factory CreateTrackingOnlyOrdersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateTrackingOnlyOrdersResponseFromJson(json);

  /// Map of created orders where the key is the order number and the value is the tracking number
  final Map<String, String> orders;

  /// Whether the request was successful
  final bool success;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() =>
      _$CreateTrackingOnlyOrdersResponseToJson(this);
}
