import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'manifest_by_carrier_response.g.dart';

/// Response wrapper for the Manifest by Carrier endpoint
/// ```
/// Attribute           Type      Description
/// records_manifested  int       The count of shipments that have been manifested as a result of this request
/// success            boolean    Determines whether the request was successfully submitted
/// ```
@JsonSerializable()
class ManifestByCarrierResponse {
  /// Creates a new manifest by carrier response instance
  ManifestByCarrierResponse({
    required this.recordsManifested,
    required this.success,
    this.errors,
  });

  /// Creates a ManifestByCarrierResponse from JSON
  factory ManifestByCarrierResponse.fromJson(Map<String, dynamic> json) =>
      _$ManifestByCarrierResponseFromJson(json);

  /// The count of shipments that have been manifested as a result of this request
  @JsonKey(name: 'records_manifested')
  final int recordsManifested;

  /// Whether the request was successfully submitted
  final bool success;

  /// Optional list of detailed errors
  final List<StarShipItError>? errors;

  /// Converts the ManifestByCarrierResponse to JSON
  Map<String, dynamic> toJson() => _$ManifestByCarrierResponseToJson(this);
}
