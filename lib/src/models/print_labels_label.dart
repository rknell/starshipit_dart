import 'package:json_annotation/json_annotation.dart';

part 'print_labels_label.g.dart';

/// Model for a printed shipping label
@JsonSerializable()
class PrintLabelsLabel {
  /// Type of label name
  final String labelType;

  /// base64 string which can be converted to PDF files for printing
  final String labelBase64String;

  /// Creates a new [PrintLabelsLabel] instance
  const PrintLabelsLabel({
    required this.labelType,
    required this.labelBase64String,
  });

  /// Creates a [PrintLabelsLabel] from JSON data
  factory PrintLabelsLabel.fromJson(Map<String, dynamic> json) =>
      _$PrintLabelsLabelFromJson(json);

  /// Converts this [PrintLabelsLabel] into JSON data
  Map<String, dynamic> toJson() => _$PrintLabelsLabelToJson(this);
}
