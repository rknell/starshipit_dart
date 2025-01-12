import 'package:json_annotation/json_annotation.dart';

part 'get_manifests_request.g.dart';

/// Request wrapper for the Get Manifests endpoint
/// ```
/// Parameter   Type      Description
/// page        integer   Page to show. Default: 1
/// limit       integer   Maximum number of records in the result. Default: 50. Maximum: 250
/// ```
@JsonSerializable()
class GetManifestsRequest {
  /// Creates a new get manifests request instance
  GetManifestsRequest({
    this.page = 1,
    this.limit = 50,
  }) : assert(limit <= 250, 'Maximum limit is 250');

  /// Creates a GetManifestsRequest from JSON
  factory GetManifestsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetManifestsRequestFromJson(json);

  /// Page to show (default: 1)
  final int page;

  /// Maximum number of records in the result (default: 50, maximum: 250)
  final int limit;

  /// Converts the request parameters to query parameters
  Map<String, String>? toQueryParameters() {
    return {
      'page': page.toString(),
      'limit': limit.toString(),
    };
  }

  /// Converts the GetManifestsRequest to JSON
  Map<String, dynamic> toJson() => _$GetManifestsRequestToJson(this);
}
