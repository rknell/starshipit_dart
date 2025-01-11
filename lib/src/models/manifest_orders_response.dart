import 'package:json_annotation/json_annotation.dart';
import 'error.dart';

part 'manifest_orders_response.g.dart';

/// Response model for manifesting printed orders
@JsonSerializable()
class ManifestOrdersResponse {
  /// Type of label name
  final String labelType;

  /// Base64 string which can be converted to the PDF files for printing
  final String pdf;

  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Creates a new [ManifestOrdersResponse] instance
  const ManifestOrdersResponse({
    required this.labelType,
    required this.pdf,
    required this.success,
    this.errors,
  });

  /// Creates a [ManifestOrdersResponse] from JSON data
  factory ManifestOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$ManifestOrdersResponseFromJson(json);

  /// Converts this [ManifestOrdersResponse] into JSON data
  Map<String, dynamic> toJson() => _$ManifestOrdersResponseToJson(this);
}
