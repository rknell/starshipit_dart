import 'package:json_annotation/json_annotation.dart';
import 'error.dart';

part 'print_packing_slips_response.g.dart';

/// Response model for printing packing slips.
///
/// Contains the type of label and base64 encoded PDF data that can be decoded
/// to generate a printable document.
@JsonSerializable()
class PrintPackingSlipsResponse {
  /// Creates a new [PrintPackingSlipsResponse] instance
  const PrintPackingSlipsResponse({
    required this.labelType,
    required this.pdf,
    required this.success,
    this.errors,
  });

  /// Creates a [PrintPackingSlipsResponse] from JSON data
  factory PrintPackingSlipsResponse.fromJson(Map<String, dynamic> json) =>
      _$PrintPackingSlipsResponseFromJson(json);

  /// Type of label name
  final String labelType;

  /// Base64 string which can be converted to a PDF file for printing
  final String pdf;

  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Converts this [PrintPackingSlipsResponse] into JSON data
  Map<String, dynamic> toJson() => _$PrintPackingSlipsResponseToJson(this);
}
