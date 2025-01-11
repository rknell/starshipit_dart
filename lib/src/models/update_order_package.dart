import 'package:json_annotation/json_annotation.dart';

part 'update_order_package.g.dart';

/// Represents a package in an update order request for the StarShipIT API
@JsonSerializable()
class UpdateOrderPackage {
  /// Creates a new update order package instance
  UpdateOrderPackage({
    required this.packageId,
    required this.name,
    required this.weight,
    required this.height,
    required this.width,
    required this.length,
    required this.packagingType,
    required this.trackingNumber,
    required this.delete,
  });

  /// The unique numeric identifier for the package
  @JsonKey(name: 'package_id')
  final int packageId;

  /// Name of the package
  final String name;

  /// Physical weight of the parcel in kilograms (kg)
  final double weight;

  /// Height of the parcel in meters (m)
  final double height;

  /// Width of the parcel in meters (m)
  final double width;

  /// Length of the parcel in meters (m)
  final double length;

  /// The packaging type for this parcel.
  /// Example valid values: Carton, Box, Envelope, Item, Jiffy, Pallet, Satchel, Skid or Bag
  @JsonKey(name: 'packaging_type')
  final String packagingType;

  /// Carrier tracking number
  @JsonKey(name: 'tracking_number')
  final String trackingNumber;

  /// An indicator used to determine whether this package should be deleted when updating the order
  final bool delete;

  /// Creates an UpdateOrderPackage from JSON
  factory UpdateOrderPackage.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderPackageFromJson(json);

  /// Converts the UpdateOrderPackage to JSON
  Map<String, dynamic> toJson() => _$UpdateOrderPackageToJson(this);
}
