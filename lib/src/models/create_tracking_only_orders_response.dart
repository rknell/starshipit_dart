import 'package:json_annotation/json_annotation.dart';

part 'create_tracking_only_orders_response.g.dart';

/// Response model for creating tracking-only orders
@JsonSerializable(explicitToJson: true)
class CreateTrackingOnlyOrdersResponse {

  const CreateTrackingOnlyOrdersResponse({
    required this.orders,
    required this.success,
  });

  /// Creates a [CreateTrackingOnlyOrdersResponse] from JSON map
  factory CreateTrackingOnlyOrdersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateTrackingOnlyOrdersResponseFromJson(json);
  /// Map of order IDs to tracking numbers for created orders
  final Map<String, String> orders;

  /// Whether the request was successful
  final bool success;

  /// Converts this [CreateTrackingOnlyOrdersResponse] to a JSON map
  Map<String, dynamic> toJson() =>
      _$CreateTrackingOnlyOrdersResponseToJson(this);
}
