import 'package:json_annotation/json_annotation.dart';

part 'print_packing_slips_request.g.dart';

/// Request model for printing packing slips.
///
/// Used to print packing slips for single or multiple orders, or create a packing summary
/// to easily identify the quantities of each SKU to pick for all orders.
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

  /// List of order IDs to print packing slips for
  final List<int> orderIds;

  /// Set to true to generate a packing summary showing quantities of each SKU
  final bool? summary;

  /// Converts this [PrintPackingSlipsRequest] into JSON data
  Map<String, dynamic> toJson() => _$PrintPackingSlipsRequestToJson(this);
}
