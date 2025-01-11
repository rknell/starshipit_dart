import 'package:json_annotation/json_annotation.dart';
import 'sender_details.dart';
import 'destination_details.dart';
import 'update_order_item.dart';
import 'update_order_package.dart';

part 'update_order_request.g.dart';

/// Represents an update order request in the StarShipIT API
@JsonSerializable()
class UpdateOrderRequest {
  /// Creates a new update order request instance
  UpdateOrderRequest({
    required this.orderId,
    required this.orderDate,
    required this.orderNumber,
    required this.reference,
    required this.carrier,
    required this.carrierServiceCode,
    required this.shippingMethod,
    required this.shippingDescription,
    required this.signatureRequired,
    required this.currency,
    required this.senderDetails,
    required this.destination,
    required this.items,
    required this.packages,
    required this.metadatas,
    required this.status,
    required this.isManifested,
  })  : assert(orderNumber.length <= 50,
            'order_number must not exceed 50 characters'),
        assert(
            reference.length <= 50, 'reference must not exceed 50 characters'),
        assert(shippingMethod.length <= 100,
            'shipping_method must not exceed 100 characters'),
        assert(shippingDescription.length <= 100,
            'shipping_description must not exceed 100 characters'),
        assert(currency.length == 3, 'currency must be exactly 3 characters');

  /// The unique numeric identifier for the order (read-only)
  @JsonKey(name: 'order_id')
  final int orderId;

  /// The date when the order was created in UTC
  @JsonKey(name: 'order_date')
  final DateTime orderDate;

  /// The identifier of the order pulled from source e-Commerce platform (max length: 50)
  @JsonKey(name: 'order_number')
  final String orderNumber;

  /// Customer's reference (max length: 50)
  final String reference;

  /// The carrier that will be used when creating shipment
  final String carrier;

  /// Carrier service code for delivery
  @JsonKey(name: 'carrier_service_code')
  final String carrierServiceCode;

  /// Delivery method name (max length: 100)
  @JsonKey(name: 'shipping_method')
  final String shippingMethod;

  /// Delivery method description (max length: 100)
  @JsonKey(name: 'shipping_description')
  final String shippingDescription;

  /// Determine whether signature is needed on delivery
  @JsonKey(name: 'signature_required')
  final bool signatureRequired;

  /// Currency code for the order value (max length: 3) e.g. AUD
  final String currency;

  /// Sender address and contact details
  @JsonKey(name: 'sender_details')
  final SenderDetails senderDetails;

  /// Shipping address and contact details
  final DestinationDetails destination;

  /// Item list containing the order item details
  final List<UpdateOrderItem> items;

  /// Package list containing the parcel details
  final List<UpdateOrderPackage> packages;

  /// Additional meta data for the order
  final List<Map<String, dynamic>> metadatas;

  /// The order status
  final String status;

  /// Determine if the order is manifested
  @JsonKey(name: 'is_manifested')
  final bool isManifested;

  /// Creates an UpdateOrderRequest from JSON
  factory UpdateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderRequestFromJson(json);

  /// Converts the UpdateOrderRequest to JSON
  Map<String, dynamic> toJson() => _$UpdateOrderRequestToJson(this);
}
