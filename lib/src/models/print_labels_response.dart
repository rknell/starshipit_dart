import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'print_labels_label.dart';

part 'print_labels_response.g.dart';

/// Response model for printing multiple shipping labels
@JsonSerializable()
class PrintLabelsResponse {
  /// List of label files printed
  final List<PrintLabelsLabel> labels;

  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Creates a new [PrintLabelsResponse] instance
  const PrintLabelsResponse({
    required this.labels,
    required this.success,
    this.errors,
  });

  /// Creates a [PrintLabelsResponse] from JSON data
  factory PrintLabelsResponse.fromJson(Map<String, dynamic> json) =>
      _$PrintLabelsResponseFromJson(json);

  /// Converts this [PrintLabelsResponse] into JSON data
  Map<String, dynamic> toJson() => _$PrintLabelsResponseToJson(this);
}
