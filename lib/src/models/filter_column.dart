import 'package:json_annotation/json_annotation.dart';

/// Represents the available filter columns in the StarShipIT API
enum FilterColumn {
  /// Filter for a specific order number
  @JsonValue('Order')
  order,

  /// Filter for a specific 'To Name'
  @JsonValue('Name')
  name,

  /// Filter for valid addresses
  @JsonValue('Address')
  address,

  /// Filter for shipped_date (if order_status is shipped)
  @JsonValue('Date')
  date,

  /// Filter for integration source
  @JsonValue('Source')
  source,

  /// Filter orders by state
  @JsonValue('State')
  state,

  /// Filter orders by country
  @JsonValue('Country')
  country,

  /// Filter orders by carrier
  @JsonValue('Carrier')
  carrier,

  /// Filter orders by carrier service / product
  @JsonValue('Service')
  service,

  /// Filter orders by Order Status
  @JsonValue('Status')
  status,

  /// Filter orders by SKU
  @JsonValue('SKU')
  sku,

  /// Filter orders by SKU (single SKU orders only)
  @JsonValue('SingleSKU')
  singleSku,

  /// Filter orders by Writeback status
  @JsonValue('Writeback')
  writeback,

  /// Filter orders by weight
  @JsonValue('Weight')
  weight,

  /// Filter orders by Shipping Method
  @JsonValue('ShippingMethod')
  shippingMethod,

  /// Filter orders by Shipping Description
  @JsonValue('ShippingDescription')
  shippingDescription,

  /// Filter orders by Tag
  @JsonValue('Tag')
  tag,
}
