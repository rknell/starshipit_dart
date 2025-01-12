import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'full_order.dart';

part 'clone_shipment_response.g.dart';

/// Response model for cloning a printed or shipped order
@JsonSerializable()
class CloneShipmentResponse {

  /// Creates a new [CloneShipmentResponse] instance
  const CloneShipmentResponse({
    required this.order,
    required this.success,
    this.errors,
  });

  /// Creates a [CloneShipmentResponse] from JSON data
  factory CloneShipmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CloneShipmentResponseFromJson(json);
  /// The details of the cloned order
  final FullOrder order;

  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Converts this [CloneShipmentResponse] into JSON data
  Map<String, dynamic> toJson() => _$CloneShipmentResponseToJson(this);
}
