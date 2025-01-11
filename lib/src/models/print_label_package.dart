import 'package:json_annotation/json_annotation.dart';

part 'print_label_package.g.dart';

/// Model for package details when printing a shipping label
@JsonSerializable()
class PrintLabelPackage {
  /// Physical weight of the parcel in kilograms (kg)
  final double? weight;

  /// Height of the parcel in meters (m)
  final double? height;

  /// Width of the parcel in meters (m)
  final double? width;

  /// Length of the parcel in meters (m)
  final double? length;

  /// Creates a new [PrintLabelPackage] instance
  const PrintLabelPackage({
    this.weight,
    this.height,
    this.width,
    this.length,
  });

  /// Creates a [PrintLabelPackage] from JSON data
  factory PrintLabelPackage.fromJson(Map<String, dynamic> json) =>
      _$PrintLabelPackageFromJson(json);

  /// Converts this [PrintLabelPackage] into JSON data
  Map<String, dynamic> toJson() => _$PrintLabelPackageToJson(this);
}
