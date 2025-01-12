import 'package:json_annotation/json_annotation.dart';

part 'rate_package.g.dart';

/// Package model used for rate requests, containing weight and dimensions.
@JsonSerializable()
class RatePackage {
  /// Creates a new [RatePackage] instance
  const RatePackage({
    required this.weight,
    this.height,
    this.width,
    this.length,
  });

  /// Factory constructor for creating a [RatePackage] instance from JSON data
  factory RatePackage.fromJson(Map<String, dynamic> json) =>
      _$RatePackageFromJson(json);

  /// Physical weight of the parcel in kilograms (kg)
  final double weight;

  /// Height of the parcel in meters (m)
  final double? height;

  /// Width of the parcel in meters (m)
  final double? width;

  /// Length of the parcel in meters (m)
  final double? length;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => _$RatePackageToJson(this);
}
