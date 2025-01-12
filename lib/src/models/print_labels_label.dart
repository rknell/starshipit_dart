import 'package:json_annotation/json_annotation.dart';

part 'print_labels_label.g.dart';

/// Model for a printed shipping label.
///
/// Contains the type of label and its base64 encoded PDF data.
/// The base64 string can be decoded to generate a printable PDF file.
@JsonSerializable()
class PrintLabelsLabel {
  /// Creates a new [PrintLabelsLabel] instance
  const PrintLabelsLabel({
    required this.labelType,
    required this.labelBase64String,
  });

  /// Creates a [PrintLabelsLabel] from JSON data
  factory PrintLabelsLabel.fromJson(Map<String, dynamic> json) =>
      _$PrintLabelsLabelFromJson(json);

  /// Type of label name
  final String labelType;

  /// Base64 string which can be converted to PDF files for printing
  final String labelBase64String;

  /// Converts this [PrintLabelsLabel] into JSON data
  Map<String, dynamic> toJson() => _$PrintLabelsLabelToJson(this);
}
