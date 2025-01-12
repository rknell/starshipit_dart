import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'get_manifests_response.g.dart';

/// Response wrapper for the Get Manifests endpoint
/// ```
/// Attribute     Type          Description
/// manifests     object list   Records for the manifests matching the supplied criteria
/// success       boolean       Determines whether the request was successfully submitted
/// errors        object list   List of detailed errors (Error Model)
/// total_pages   integer       Total number of pages containing records
/// total_count   integer       Total number of manifest records
/// ```
@JsonSerializable()
class GetManifestsResponse {
  /// Creates a new get manifests response instance
  GetManifestsResponse({
    required this.manifests,
    required this.success,
    this.errors,
    required this.totalPages,
    required this.totalCount,
  });

  /// Creates a GetManifestsResponse from JSON
  factory GetManifestsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetManifestsResponseFromJson(json);

  /// Records for the manifests matching the supplied criteria
  final List<Manifest> manifests;

  /// Whether the request was successfully submitted
  final bool success;

  /// Optional list of detailed errors
  final List<StarShipItError>? errors;

  /// Total number of pages containing records
  @JsonKey(name: 'total_pages')
  final int totalPages;

  /// Total number of manifest records
  @JsonKey(name: 'total_count')
  final int totalCount;

  /// Converts the GetManifestsResponse to JSON
  Map<String, dynamic> toJson() => _$GetManifestsResponseToJson(this);
}
