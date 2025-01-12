import 'package:json_annotation/json_annotation.dart';

part 'print_packing_slips_request.g.dart';

/// Request model for printing packing slips
@JsonSerializable()
class PrintPackingSlipsRequest {

  /// Creates a new [PrintPackingSlipsRequest] instance
  const PrintPackingSlipsRequest({
    required this.orderIds,
    this.summary,
  });

  /// Creates a [PrintPackingSlipsRequest] from JSON data
  factory PrintPackingSlipsRequest.fromJson(Map<String, dynamic> json) =>
      _$PrintPackingSlipsRequestFromJson(json);
  /// List of order_ids to print packing slips for
  final List<int> orderIds;

  /// Set to true to generate packing summary
  final bool? summary;

  /// Converts this [PrintPackingSlipsRequest] into JSON data
  Map<String, dynamic> toJson() => _$PrintPackingSlipsRequestToJson(this);
}
