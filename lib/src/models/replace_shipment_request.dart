import 'package:json_annotation/json_annotation.dart';

part 'replace_shipment_request.g.dart';

/// Request model for redoing a printed or shipped order
@JsonSerializable()
class ReplaceShipmentRequest {

  /// Creates a new [ReplaceShipmentRequest] instance
  const ReplaceShipmentRequest({
    required this.orderId,
  });

  /// Creates a [ReplaceShipmentRequest] from JSON data
  factory ReplaceShipmentRequest.fromJson(Map<String, dynamic> json) =>
      _$ReplaceShipmentRequestFromJson(json);
  /// The shipped or printed order id to redo
  final int orderId;

  /// Converts this [ReplaceShipmentRequest] into JSON data
  Map<String, dynamic> toJson() => _$ReplaceShipmentRequestToJson(this);
}
