import 'package:json_annotation/json_annotation.dart';
import 'sender_details.dart';
import 'destination_details.dart';
import 'full_order_item.dart';
import 'full_order_package.dart';

part 'full_order.g.dart';

/// The type of shipment
enum ShipmentType {
  /// Outgoing shipment
  @JsonValue('Outgoing')
  outgoing,

  /// Return shipment
  @JsonValue('Return')
  returnShipment,

  /// Transfer shipment
  @JsonValue('Transfer')
  transfer,
}

/// The validation status of an address
enum AddressValidation {
  /// Address has not been checked
  @JsonValue('NotChecked')
  notChecked,

  /// Address is valid
  @JsonValue('Valid')
  valid,

  /// Address is invalid
  @JsonValue('Invalid')
  invalid,
}

/// Represents a full order response from the StarShipIT API
/// ```
/// Attribute              Type          Description
/// order_id              integer       The unique numeric identifier for the order
/// order_date            datetime      The date when the order was created in UTC
/// order_number          string        The identifier of the order pulled from source e-Commerce platform
/// reference             string        Customer's reference
/// carrier               string        The carrier that will be used when creating shipment
/// carrier_name          string        Name of the carrier used for shipment delivery
/// carrier_service_code  string        Carrier service code for delivery
/// shipping_method       string        Delivery method name
/// shipping_description  string        Delivery method description
/// signature_required    boolean       Determine whether signature is needed on delivery
/// dangerous_goods       boolean       Determine whether shipment contains dangerous goods
/// currency              string        Currency code for the order value (e.g. AUD)
/// sender_details        object        Sender address and contact details
/// destination          object        Shipping address and contact details
/// items                object list   Item list containing the order item details
/// packages             object list   Package list containing the parcel details
/// metadatas            object list   Additional meta data for the order
/// events               object list   Historical events associated with this order
/// declared_value       double        Declared value of an international order
/// archived             boolean       Determine whether a shipment is archived
/// manifest_number      integer       Carrier manifest identifier
/// address_validation   string        Determine whether an address is validated for a shipment. NotChecked, Valid or Invalid
/// child_consignment_ids string       Displays child consignment ids if the shipment has been merged
/// create_return        boolean       Determine whether a return label was generated when outgoing label was generated
/// dtp                 boolean       Determine whether duty and tax has been paid for a shipment
/// export_type         string        Export type of a shipment
/// add_insurance       boolean       Determine whether shipment has insurance
/// insurance_value     double        Shipment insurance value
/// plt                boolean       Determine whether shipment is paperless trade
/// type                enum         Type of shipment. Outgoing, Return or Transfer
/// platform            string        The order platform
/// status              string        The order status. Unshipped, Saved, Printed or Delivered)
/// manifested          boolean       Detemine whether shipment is manifested
/// ```
@JsonSerializable()
class FullOrder {
  /// Creates a new full order instance
  FullOrder({
    required this.orderId,
    required this.orderDate,
    required this.orderNumber,
    required this.reference,
    required this.carrier,
    required this.carrierName,
    required this.carrierServiceCode,
    required this.shippingMethod,
    required this.shippingDescription,
    required this.signatureRequired,
    required this.dangerousGoods,
    required this.currency,
    required this.senderDetails,
    required this.destination,
    required this.items,
    required this.packages,
    required this.metadatas,
    required this.events,
    required this.declaredValue,
    required this.archived,
    required this.manifestNumber,
    required this.addressValidation,
    required this.childConsignmentIds,
    required this.createReturn,
    required this.dtp,
    required this.exportType,
    required this.addInsurance,
    required this.insuranceValue,
    required this.plt,
    required this.type,
    required this.platform,
    required this.status,
    required this.manifested,
  });

  /// Creates a FullOrder from JSON
  factory FullOrder.fromJson(Map<String, dynamic> json) =>
      _$FullOrderFromJson(json);

  /// The unique numeric identifier for the order
  @JsonKey(name: 'order_id')
  final int orderId;

  /// The date when the order was created in UTC
  @JsonKey(name: 'order_date')
  final DateTime orderDate;

  /// The identifier of the order pulled from source e-Commerce platform
  @JsonKey(name: 'order_number')
  final String orderNumber;

  /// Customer's reference
  final String? reference;

  /// The carrier that will be used when creating shipment
  final String carrier;

  /// Name of the carrier used for shipment delivery
  @JsonKey(name: 'carrier_name')
  final String carrierName;

  /// Carrier service code for delivery
  @JsonKey(name: 'carrier_service_code')
  final String carrierServiceCode;

  /// Delivery method name
  @JsonKey(name: 'shipping_method')
  final String shippingMethod;

  /// Delivery method description
  @JsonKey(name: 'shipping_description')
  final String shippingDescription;

  /// Determine whether signature is needed on delivery
  @JsonKey(name: 'signature_required')
  final bool signatureRequired;

  /// Determine whether shipment contains dangerous goods
  @JsonKey(name: 'dangerous_goods')
  final bool dangerousGoods;

  /// Currency code for the order value (e.g. AUD)
  final String currency;

  /// Sender address and contact details
  @JsonKey(name: 'sender_details')
  final SenderDetails senderDetails;

  /// Shipping address and contact details
  final DestinationDetails destination;

  /// Item list containing the order item details
  final List<FullOrderItem> items;

  /// Package list containing the parcel details
  final List<FullOrderPackage> packages;

  /// Additional meta data for the order
  final List<Map<String, dynamic>> metadatas;

  /// Historical events associated with this order
  final List<Map<String, dynamic>> events;

  /// Declared value of an international order
  @JsonKey(name: 'declared_value')
  final double declaredValue;

  /// Determine whether a shipment is archived
  final bool archived;

  /// Carrier manifest identifier
  @JsonKey(name: 'manifest_number')
  final int manifestNumber;

  /// Determine whether an address is validated for a shipment
  @JsonKey(name: 'address_validation')
  final AddressValidation addressValidation;

  /// Displays child consignment ids if the shipment has been merged
  @JsonKey(name: 'child_consignment_ids')
  final String childConsignmentIds;

  /// Determine whether a return label was generated when outgoing label was generated
  @JsonKey(name: 'create_return')
  final bool createReturn;

  /// Determine whether duty and tax has been paid for a shipment
  final bool dtp;

  /// Export type of a shipment
  @JsonKey(name: 'export_type')
  final String exportType;

  /// Determine whether shipment has insurance
  @JsonKey(name: 'add_insurance')
  final bool addInsurance;

  /// Shipment insurance value
  @JsonKey(name: 'insurance_value')
  final double insuranceValue;

  /// Determine whether shipment is paperless trade
  final bool plt;

  /// Type of shipment (Outgoing, Return or Transfer)
  final ShipmentType type;

  /// The order platform
  final String platform;

  /// The order status (Unshipped, Saved, Printed or Delivered)
  final String status;

  /// Determine whether shipment is manifested
  final bool manifested;

  /// Converts the FullOrder to JSON
  Map<String, dynamic> toJson() => _$FullOrderToJson(this);
}
