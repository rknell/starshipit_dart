import 'package:json_annotation/json_annotation.dart';

part 'meta_data.g.dart';

/// API Field Structure:
/// ```
/// Attribute        Type      Description
/// metafield_key   string    The unique identifier for the meta field key
/// value           string    The information stored for the meta field
/// ```
@JsonSerializable()
class MetaData {
  /// Creates a new meta data instance
  MetaData({
    required this.metafieldKey,
    required this.value,
  });

  /// Creates a MetaData from JSON
  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  /// The unique identifier for the meta field key
  @JsonKey(name: 'metafield_key')
  final String metafieldKey;

  /// The information stored for the meta field
  final String value;

  /// Converts the MetaData to JSON
  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}
