import 'package:json_annotation/json_annotation.dart';
import 'error.dart';

part 'print_label_response.g.dart';

/// Response model for printing a shipping label
@JsonSerializable()
class PrintLabelResponse {
  /// The unique numeric identifier for the order
  final int orderId;

  /// The identifier of the order pulled from source e-Commerce platform
  final String orderNumber;

  /// Name of the carrier used for shipment delivery
  final String carrierName;

  /// List of tracking numbers
  final List<String> trackingNumbers;

  /// List of base64 string which can be converted to PDF files for printing
  final List<String> labels;

  /// List of label type codes which will match the label in order
  final List<String> labelTypes;

  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Creates a new [PrintLabelResponse] instance
  const PrintLabelResponse({
    required this.orderId,
    required this.orderNumber,
    required this.carrierName,
    required this.trackingNumbers,
    required this.labels,
    required this.labelTypes,
    required this.success,
    this.errors,
  });

  /// Creates a [PrintLabelResponse] from JSON data
  factory PrintLabelResponse.fromJson(Map<String, dynamic> json) =>
      _$PrintLabelResponseFromJson(json);

  /// Converts this [PrintLabelResponse] into JSON data
  Map<String, dynamic> toJson() => _$PrintLabelResponseToJson(this);
}
