import 'package:json_annotation/json_annotation.dart';

part 'create_order_package.g.dart';

/// Represents a package in a create order request for the StarShipIT API
@JsonSerializable()
class CreateOrderPackage {
  /// Creates a new create order package instance
  CreateOrderPackage({
    this.weight,
    this.height,
    this.width,
    this.length,
  });

  /// Physical weight of the parcel in kilograms (kg)
  final double? weight;

  /// Height of the parcel in meters (m)
  final double? height;

  /// Width of the parcel in meters (m)
  final double? width;

  /// Length of the parcel in meters (m)
  final double? length;

  /// Creates a CreateOrderPackage from JSON
  factory CreateOrderPackage.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderPackageFromJson(json);

  /// Converts the CreateOrderPackage to JSON
  Map<String, dynamic> toJson() => _$CreateOrderPackageToJson(this);
}
