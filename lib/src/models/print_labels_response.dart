import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'print_labels_label.dart';

part 'print_labels_response.g.dart';

/// Response model for printing multiple shipping labels.
///
/// Contains a list of label files printed, each with a label type and base64 encoded PDF data.
/// The base64 strings can be decoded to generate printable PDF files.
@JsonSerializable()
class PrintLabelsResponse {
  /// Creates a new [PrintLabelsResponse] instance
  const PrintLabelsResponse({
    required this.labels,
    required this.success,
    this.errors,
  });

  /// Creates a [PrintLabelsResponse] from JSON data
  factory PrintLabelsResponse.fromJson(Map<String, dynamic> json) =>
      _$PrintLabelsResponseFromJson(json);

  /// List of label files printed, each containing a label type and base64 encoded PDF data
  final List<PrintLabelsLabel> labels;

  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Converts this [PrintLabelsResponse] into JSON data
  Map<String, dynamic> toJson() => _$PrintLabelsResponseToJson(this);
}
