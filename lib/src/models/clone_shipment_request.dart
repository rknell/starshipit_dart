import 'package:json_annotation/json_annotation.dart';

part 'clone_shipment_request.g.dart';

/// Request model for cloning a printed or shipped order
@JsonSerializable()
class CloneShipmentRequest {
  /// The shipped or printed order_id to clone
  final int orderId;

  /// Determines whether the clone is for a return order
  final bool? toReturnShipment;

  /// Creates a new [CloneShipmentRequest] instance
  const CloneShipmentRequest({
    required this.orderId,
    this.toReturnShipment,
  });

  /// Creates a [CloneShipmentRequest] from JSON data
  factory CloneShipmentRequest.fromJson(Map<String, dynamic> json) =>
      _$CloneShipmentRequestFromJson(json);

  /// Converts this [CloneShipmentRequest] into JSON data
  Map<String, dynamic> toJson() => _$CloneShipmentRequestToJson(this);
}
