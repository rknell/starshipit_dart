import 'package:json_annotation/json_annotation.dart';

part 'manifest_by_carrier_request.g.dart';

/// Request wrapper for the Manifest by Carrier endpoint
/// ```
/// Parameter   Type      Description
/// carrier     string    The string representation of the carrier enum value for the selected carrier
/// ```
@JsonSerializable()
class ManifestByCarrierRequest {
  /// Creates a new manifest by carrier request instance
  ManifestByCarrierRequest({
    required this.carrier,
  });

  /// Creates a ManifestByCarrierRequest from JSON
  factory ManifestByCarrierRequest.fromJson(Map<String, dynamic> json) =>
      _$ManifestByCarrierRequestFromJson(json);

  /// The string representation of the carrier enum value for the selected carrier
  final String carrier;

  /// Converts the ManifestByCarrierRequest to JSON
  Map<String, dynamic> toJson() => _$ManifestByCarrierRequestToJson(this);
}
