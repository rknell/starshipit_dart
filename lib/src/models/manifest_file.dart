import 'package:json_annotation/json_annotation.dart';

part 'manifest_file.g.dart';

/// Model representing a manifest file
/// ```
/// Attribute    Type     Description
/// file_name    string   Name of this manifest file
/// file_data    string   Base64 string which can be converted to PDF file for printing
/// ```
@JsonSerializable()
class ManifestFile {
  /// Creates a new manifest file instance
  ManifestFile({
    required this.fileName,
    required this.fileData,
  });

  /// Creates a ManifestFile from JSON
  factory ManifestFile.fromJson(Map<String, dynamic> json) =>
      _$ManifestFileFromJson(json);

  /// Name of this manifest file
  @JsonKey(name: 'file_name')
  final String fileName;

  /// Base64 string which can be converted to PDF file for printing
  @JsonKey(name: 'file_data')
  final String fileData;

  /// Converts the ManifestFile to JSON
  Map<String, dynamic> toJson() => _$ManifestFileToJson(this);
}
