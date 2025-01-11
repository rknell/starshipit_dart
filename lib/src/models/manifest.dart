import 'package:json_annotation/json_annotation.dart';

part 'manifest.g.dart';

/// Model representing a manifest record
/// ```
/// Attribute           Type      Description
/// id                  integer   The unique identifier for the manifest
/// name                string    Name of this manifest
/// date                datetime  The date the manifest was submitted
/// number              integer   Manifest number
/// numberArticles      integer   Number of packages on this manifest
/// numberConsignments  integer   Number of consignments on this manifest
/// fileName1           string    Name of the first manifest file
/// fileName2           string    Name of the second manifest file
/// carrierId          shortint  Unique id of the carrier for this manifest
/// ```
@JsonSerializable()
class Manifest {
  /// Creates a new manifest instance
  Manifest({
    required this.id,
    required this.name,
    required this.date,
    required this.number,
    required this.numberArticles,
    required this.numberConsignments,
    required this.fileName1,
    required this.fileName2,
    required this.carrierId,
  });

  /// The unique identifier for the manifest
  final int id;

  /// Name of this manifest
  final String name;

  /// The date the manifest was submitted
  final DateTime date;

  /// Manifest number
  final int number;

  /// Number of packages on this manifest
  @JsonKey(name: 'numberArticles')
  final int numberArticles;

  /// Number of consignments on this manifest
  @JsonKey(name: 'numberConsignments')
  final int numberConsignments;

  /// Name of the first manifest file
  @JsonKey(name: 'fileName1')
  final String fileName1;

  /// Name of the second manifest file
  @JsonKey(name: 'fileName2')
  final String fileName2;

  /// Unique id of the carrier for this manifest
  @JsonKey(name: 'carrierId')
  final int carrierId;

  /// Creates a Manifest from JSON
  factory Manifest.fromJson(Map<String, dynamic> json) =>
      _$ManifestFromJson(json);

  /// Converts the Manifest to JSON
  Map<String, dynamic> toJson() => _$ManifestToJson(this);
}
