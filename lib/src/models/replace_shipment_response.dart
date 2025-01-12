import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'full_order.dart';

part 'replace_shipment_response.g.dart';

/// Response model for redoing a printed or shipped order
@JsonSerializable()
class ReplaceShipmentResponse {

  /// Creates a new [ReplaceShipmentResponse] instance
  const ReplaceShipmentResponse({
    required this.order,
    required this.success,
    this.errors,
  });

  /// Creates a [ReplaceShipmentResponse] from JSON data
  factory ReplaceShipmentResponse.fromJson(Map<String, dynamic> json) =>
      _$ReplaceShipmentResponseFromJson(json);
  /// The details of the replaced order
  final FullOrder order;

  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Converts this [ReplaceShipmentResponse] into JSON data
  Map<String, dynamic> toJson() => _$ReplaceShipmentResponseToJson(this);
}
