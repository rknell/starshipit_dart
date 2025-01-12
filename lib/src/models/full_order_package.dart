import 'package:json_annotation/json_annotation.dart';
import 'label_info.dart';

part 'full_order_package.g.dart';

/// API Field Structure:
/// ```
/// Attribute            Type      Description
/// package_id          integer   The unique numeric identifier for the package
/// name               string    Name of the package
/// weight             double    Physical weight of the parcel in kilograms (kg)
/// height             double    Height of the parcel in meters (m)
/// width              double    Width of the parcel in meters (m)
/// length             double    Length of the parcel in meters (m)
/// packaging_type     string    The packaging type for this parcel. Example valid values: Carton, Box, Envelope, Item, Jiffy, Pallet, Satchel, Skid or Bag
/// carrier_service_code string   Carrier service code for delivery
/// carrier_service_name string   Carrier service name for delivery
/// tracking_number    string    Carrier tracking number
/// tracking_url       string    Carrier tracking url
/// delivery_status    string    Current delivery status of this parcel
/// shipment_type      string    Type of shipment: outgoing, return or transfer
/// label_created_date datetime  The date and time when the label was generated in UTC
/// labels             list      List of label files associated with this package
/// contents          string    The shipment contents that appears on the label or invoice
/// ```
@JsonSerializable()
class FullOrderPackage {
  /// Creates a new full order package instance
  FullOrderPackage({
    required this.packageId,
    required this.name,
    required this.weight,
    required this.height,
    required this.width,
    required this.length,
    required this.packagingType,
    required this.carrierServiceCode,
    required this.carrierServiceName,
    required this.trackingNumber,
    required this.trackingUrl,
    required this.deliveryStatus,
    required this.shipmentType,
    required this.labelCreatedDate,
    required this.labels,
    required this.contents,
  });

  /// Creates a FullOrderPackage from JSON
  factory FullOrderPackage.fromJson(Map<String, dynamic> json) =>
      _$FullOrderPackageFromJson(json);

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

  /// Carrier service code for delivery
  @JsonKey(name: 'carrier_service_code')
  final String carrierServiceCode;

  /// Carrier service name for delivery
  @JsonKey(name: 'carrier_service_name')
  final String carrierServiceName;

  /// Carrier tracking number
  @JsonKey(name: 'tracking_number')
  final String trackingNumber;

  /// Carrier tracking url
  @JsonKey(name: 'tracking_url')
  final String trackingUrl;

  /// Current delivery status of this parcel
  @JsonKey(name: 'delivery_status')
  final String deliveryStatus;

  /// Type of shipment: outgoing, return or transfer
  @JsonKey(name: 'shipment_type')
  final String shipmentType;

  /// The date and time when the label was generated in UTC
  @JsonKey(name: 'label_created_date')
  final DateTime labelCreatedDate;

  /// List of label files associated with this package
  final List<LabelInfo> labels;

  /// The shipment contents that appears on the label or invoice
  final String contents;

  /// Converts the FullOrderPackage to JSON
  Map<String, dynamic> toJson() => _$FullOrderPackageToJson(this);
}
