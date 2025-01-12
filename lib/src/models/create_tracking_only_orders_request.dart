import 'package:json_annotation/json_annotation.dart';
import 'tracking_only_order.dart';

part 'create_tracking_only_orders_request.g.dart';

/// Request model for creating tracking-only orders
@JsonSerializable(explicitToJson: true)
class CreateTrackingOnlyOrdersRequest {

  const CreateTrackingOnlyOrdersRequest({
    required this.orders,
  });

  /// Creates a [CreateTrackingOnlyOrdersRequest] from JSON map
  factory CreateTrackingOnlyOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTrackingOnlyOrdersRequestFromJson(json);
  /// The list of tracking-only orders to create
  final List<TrackingOnlyOrder> orders;

  /// Converts this [CreateTrackingOnlyOrdersRequest] to a JSON map
  Map<String, dynamic> toJson() =>
      _$CreateTrackingOnlyOrdersRequestToJson(this);
}
