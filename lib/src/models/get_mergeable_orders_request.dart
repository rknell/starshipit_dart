import 'package:json_annotation/json_annotation.dart';

part 'get_mergeable_orders_request.g.dart';

/// Request model for getting a list of mergeable orders
@JsonSerializable()
class GetMergeableOrdersRequest {

  /// Creates a new [GetMergeableOrdersRequest] instance
  const GetMergeableOrdersRequest({
    this.limit,
    this.page,
  });

  /// Creates a [GetMergeableOrdersRequest] from JSON data
  factory GetMergeableOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$GetMergeableOrdersRequestFromJson(json);
  /// Maximum number of results to return (default: 50, min: 1, max: 250)
  final int? limit;

  /// Page number for pagination (default: 1)
  final int? page;

  /// Converts this [GetMergeableOrdersRequest] into JSON data
  Map<String, dynamic> toJson() => _$GetMergeableOrdersRequestToJson(this);

  /// Converts the request parameters to query parameters for the API call
  Map<String, String>? toQueryParameters() {
    final params = <String, String>{};

    if (limit != null) {
      params['limit'] = limit.toString();
    }

    if (page != null) {
      params['page'] = page.toString();
    }

    return params.isEmpty ? null : params;
  }
}
