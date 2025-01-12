import 'package:json_annotation/json_annotation.dart';
import 'print_label_package.dart';

part 'print_label_request.g.dart';

/// Request model for printing a shipping label
@JsonSerializable()
class PrintLabelRequest {

  /// Creates a new [PrintLabelRequest] instance
  const PrintLabelRequest({
    this.orderId,
    this.orderNumber,
    required this.carrier,
    required this.carrierServiceCode,
    required this.packages,
    this.reprint = false,
  }) : assert(
          orderId != null || orderNumber != null,
          'Either orderId or orderNumber must be provided',
        );

  /// Creates a [PrintLabelRequest] from JSON data
  factory PrintLabelRequest.fromJson(Map<String, dynamic> json) =>
      _$PrintLabelRequestFromJson(json);
  /// The unique numeric identifier for the order (optional)
  final int? orderId;

  /// The identifier of the order pulled from source e-Commerce platform (optional)
  final String? orderNumber;

  /// The carrier that will be used when creating shipment
  final String carrier;

  /// Carrier service code for delivery
  final String carrierServiceCode;

  /// Package list containing the parcel details
  final List<PrintLabelPackage> packages;

  /// Returns labels previously generated for the printed order
  final bool reprint;

  /// Converts this [PrintLabelRequest] into JSON data
  Map<String, dynamic> toJson() => _$PrintLabelRequestToJson(this);
}
