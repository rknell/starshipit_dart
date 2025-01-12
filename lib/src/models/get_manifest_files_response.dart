import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'get_manifest_files_response.g.dart';

/// Response wrapper for the Get Manifest Files endpoint
/// ```
/// Attribute     Type          Description
/// files         object list   List of records for the manifest files matching the supplied criteria
/// success       boolean       Determines whether the request was successfully submitted
/// errors        object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class GetManifestFilesResponse {
  /// Creates a new get manifest files response instance
  GetManifestFilesResponse({
    required this.files,
    required this.success,
    this.errors,
  });

  /// Creates a GetManifestFilesResponse from JSON
  factory GetManifestFilesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetManifestFilesResponseFromJson(json);

  /// List of records for the manifest files matching the supplied criteria
  final List<ManifestFile> files;

  /// Whether the request was successfully submitted
  final bool success;

  /// Optional list of detailed errors
  final List<StarShipItError>? errors;

  /// Converts the GetManifestFilesResponse to JSON
  Map<String, dynamic> toJson() => _$GetManifestFilesResponseToJson(this);
}
