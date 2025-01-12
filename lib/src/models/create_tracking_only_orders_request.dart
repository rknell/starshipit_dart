import 'package:json_annotation/json_annotation.dart';
import 'tracking_only_order.dart';

part 'create_tracking_only_orders_request.g.dart';

/// Request model for creating tracking-only orders in StarShipIT.
///
/// Tracking-only orders are orders that were created and shipped outside of StarShipIT
/// but need to be tracked in the StarShipIT system. This provides a centralized tracking
/// hub for all orders, regardless of where they were created.
@JsonSerializable()
class CreateTrackingOnlyOrdersRequest {
  /// Creates a new [CreateTrackingOnlyOrdersRequest] instance
  const CreateTrackingOnlyOrdersRequest({
    required this.orders,
  });

  /// Factory constructor for creating a [CreateTrackingOnlyOrdersRequest] instance from JSON data
  factory CreateTrackingOnlyOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTrackingOnlyOrdersRequestFromJson(json);

  /// List of tracking-only orders to create
  final List<TrackingOnlyOrder> orders;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() =>
      _$CreateTrackingOnlyOrdersRequestToJson(this);
}
