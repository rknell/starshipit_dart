import 'package:json_annotation/json_annotation.dart';

part 'label_info.g.dart';

/// API Field Structure:
/// ```
/// Attribute            Type      Description
/// label_type          string
/// label_url           string
/// label_base64_string string
/// ```
@JsonSerializable()
class LabelInfo {
  /// Creates a new label info instance
  LabelInfo({
    required this.labelType,
    required this.labelUrl,
    required this.labelBase64String,
  });

  /// The type of the label
  @JsonKey(name: 'label_type')
  final String labelType;

  /// The URL to the label
  @JsonKey(name: 'label_url')
  final String labelUrl;

  /// The base64 encoded string of the label
  @JsonKey(name: 'label_base64_string')
  final String labelBase64String;

  /// Creates a LabelInfo from JSON
  factory LabelInfo.fromJson(Map<String, dynamic> json) =>
      _$LabelInfoFromJson(json);

  /// Converts the LabelInfo to JSON
  Map<String, dynamic> toJson() => _$LabelInfoToJson(this);
}
