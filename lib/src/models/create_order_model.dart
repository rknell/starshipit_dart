import 'package:json_annotation/json_annotation.dart';
import 'sender_details.dart';
import 'destination_details.dart';
import 'create_order_item.dart';
import 'create_order_package.dart';

part 'create_order_model.g.dart';

/// Request wrapper for the Create Order endpoint
/// ```
/// Attribute                    Type        Description
/// order_date (optional)        datetime    The date when the order was created in UTC
/// order_number                 string      The identifier of the order pulled from source e-Commerce platform (max length: 50)
/// reference (optional)         string      Customer's reference (max length: 50)
/// shipping_method (optional)   string      Delivery method name (max length: 100)
/// shipping_description (opt)   string      Delivery method description (max length: 100)
/// signature_required (opt)     boolean     Determine whether signature is needed on delivery
/// return_order (optional)      boolean     If true, only the return label will be generated
/// currency (optional)          string      Currency code for the order value (max length: 3) e.g. AUD
/// sender_details (optional)    object      Sender address and contact details
/// destination                  object      Shipping address and contact details
/// items (optional)            list        Item list containing the order item details
/// packages (optional)         list        Package list containing the parcel details
/// ```
@JsonSerializable()
class CreateOrderModel {
  /// Creates a new create order request instance
  CreateOrderModel({
    this.orderDate,
    required this.orderNumber,
    this.reference,
    this.shippingMethod,
    this.shippingDescription,
    this.signatureRequired,
    this.returnOrder,
    this.currency,
    this.senderDetails,
    required this.destination,
    this.items,
    this.packages,
  })  : assert(orderNumber.length <= 50,
            'order_number must not exceed 50 characters'),
        assert(reference == null || reference.length <= 50,
            'reference must not exceed 50 characters'),
        assert(shippingMethod == null || shippingMethod.length <= 100,
            'shipping_method must not exceed 100 characters'),
        assert(shippingDescription == null || shippingDescription.length <= 100,
            'shipping_description must not exceed 100 characters'),
        assert(currency == null || currency.length == 3,
            'currency must be exactly 3 characters');

  /// Creates a CreateOrderRequest from JSON
  factory CreateOrderModel.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderModelFromJson(json);

  /// The date when the order was created in UTC
  @JsonKey(name: 'order_date')
  final DateTime? orderDate;

  /// The identifier of the order pulled from source e-Commerce platform (max length: 50)
  @JsonKey(name: 'order_number')
  final String orderNumber;

  /// Customer's reference (max length: 50)
  final String? reference;

  /// Delivery method name (max length: 100)
  @JsonKey(name: 'shipping_method')
  final String? shippingMethod;

  /// Delivery method description (max length: 100)
  @JsonKey(name: 'shipping_description')
  final String? shippingDescription;

  /// Determine whether signature is needed on delivery
  @JsonKey(name: 'signature_required')
  final bool? signatureRequired;

  /// If true, only the return label will be generated
  @JsonKey(name: 'return_order')
  final bool? returnOrder;

  /// Currency code for the order value (max length: 3) e.g. AUD
  final String? currency;

  /// Sender address and contact details
  @JsonKey(name: 'sender_details')
  final SenderDetails? senderDetails;

  /// Shipping address and contact details
  final DestinationDetails destination;

  /// Item list containing the order item details
  final List<CreateOrderItem>? items;

  /// Package list containing the parcel details
  final List<CreateOrderPackage>? packages;

  /// Converts the CreateOrderRequest to JSON
  Map<String, dynamic> toJson() => _$CreateOrderModelToJson(this);
}
