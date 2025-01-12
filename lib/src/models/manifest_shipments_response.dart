import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'manifest_shipments_response.g.dart';

/// Response wrapper for the Manifest Orders endpoint
/// ```
/// Attribute    Type          Description
/// pdf          string        The pdf of the manifest file created
/// file_name    string        Description of the pdf file returned
/// success      boolean       Determines whether the request was successfully submitted
/// errors       object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class ManifestShipmentsResponse {
  /// Creates a new manifest shipments response instance
  ManifestShipmentsResponse({
    required this.pdf,
    required this.fileName,
    required this.success,
    this.errors,
  });

  /// Creates a ManifestShipmentsResponse from JSON
  factory ManifestShipmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ManifestShipmentsResponseFromJson(json);

  /// The pdf of the manifest file created
  final String pdf;

  /// Description of the pdf file returned
  @JsonKey(name: 'file_name')
  final String fileName;

  /// Whether the request was successfully submitted
  final bool success;

  /// Optional list of detailed errors
  final List<StarShipItError>? errors;

  /// Converts the ManifestShipmentsResponse to JSON
  Map<String, dynamic> toJson() => _$ManifestShipmentsResponseToJson(this);
}
