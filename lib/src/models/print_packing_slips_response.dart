import 'package:json_annotation/json_annotation.dart';
import 'error.dart';

part 'print_packing_slips_response.g.dart';

/// Response model for printing packing slips
@JsonSerializable()
class PrintPackingSlipsResponse {
  /// Type of label name
  final String labelType;

  /// base64 string which can be converted to a PDF file for printing
  final String pdf;

  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

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

  /// Converts this [PrintPackingSlipsResponse] into JSON data
  Map<String, dynamic> toJson() => _$PrintPackingSlipsResponseToJson(this);
}
