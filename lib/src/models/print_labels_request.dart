import 'package:json_annotation/json_annotation.dart';

part 'print_labels_request.g.dart';

/// Request model for printing multiple shipping labels
@JsonSerializable()
class PrintLabelsRequest {
  /// List of unique numeric identifier for the order
  final List<int> orderIds;

  /// Returns labels previously generated for the printed order
  final bool reprint;

  /// Creates a new [PrintLabelsRequest] instance
  const PrintLabelsRequest({
    required this.orderIds,
    this.reprint = false,
  });

  /// Creates a [PrintLabelsRequest] from JSON data
  factory PrintLabelsRequest.fromJson(Map<String, dynamic> json) =>
      _$PrintLabelsRequestFromJson(json);

  /// Converts this [PrintLabelsRequest] into JSON data
  Map<String, dynamic> toJson() => _$PrintLabelsRequestToJson(this);
}
