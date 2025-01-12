import 'package:json_annotation/json_annotation.dart';

part 'tax_numbers.g.dart';

/// The type of tax number
enum TaxType {
  /// Australia GST Number
  @JsonValue('australia_gst_number')
  australiaGstNumber,

  /// Brazil Federal Tax Number
  @JsonValue('brazil_federal_tax_number')
  brazilFederalTaxNumber,

  /// Data Universal Numbering System
  @JsonValue('data_universal_numbering_system')
  dataUniversalNumberingSystem,

  /// Employer ID
  @JsonValue('employer_id')
  employerId,

  /// EORI Number
  @JsonValue('eori_number')
  eoriNumber,

  /// Federal Tax ID
  @JsonValue('federal_tax_id')
  federalTaxId,

  /// GST Registration
  @JsonValue('gst_registration')
  gstRegistration,

  /// Ireland Tax ID
  @JsonValue('ireland_tax_id')
  irelandTaxId,

  /// Russian Taxpayer Personal ID
  @JsonValue('russian_taxpayer_personal_id')
  russianTaxpayerPersonalId,

  /// Russian Tax Registration Event Code
  @JsonValue('russian_tax_registration_event_code')
  russianTaxRegistrationEventCode,

  /// Movement Reference Code
  @JsonValue('movement_reference_code')
  movementReferenceCode,

  /// Russian Primary State Registration Number
  @JsonValue('russian_primary_state_registration_number')
  russianPrimaryStateRegistrationNumber,

  /// Russian OKPO Code
  @JsonValue('russian_okpo_code')
  russianOkpoCode,

  /// AusID GST Registration
  @JsonValue('ausid_gst_registration')
  ausidGstRegistration,

  /// Social Security Number
  @JsonValue('social_security_number')
  socialSecurityNumber,

  /// State Tax ID
  @JsonValue('state_tax_id')
  stateTaxId,

  /// VAT Registration
  @JsonValue('vat_registration')
  vatRegistration,

  /// Overseas Registered Supplier
  @JsonValue('overseas_registered_supplier')
  overseasRegisteredSupplier,

  /// Import One Stop Shop
  @JsonValue('import_one_stop_shop')
  importOneStopShop,

  /// VAT in eCommerce
  @JsonValue('vat_in_ecommerce')
  vatInEcommerce,

  /// Free Trade Zone ID
  @JsonValue('free_trade_zone_id')
  freeTradeZoneId,

  /// Deferment Account Duties Only
  @JsonValue('deferment_account_duties_only')
  defermentAccountDutiesOnly,

  /// Deferment Account Tax Only
  @JsonValue('deferment_account_tax_only')
  defermentAccountTaxOnly,

  /// Deferment Account Duties Taxes and Fees Only
  @JsonValue('deferment_account_duties_taxes_and_fees_only')
  defermentAccountDutiesTaxesAndFeesOnly,

  /// GB VAT Foreign Registration
  @JsonValue('gb_vat_foreign_registration')
  gbVatForeignRegistration,

  /// Unified Social Credit Identifier Code
  @JsonValue('unified_social_credit_identifier_code')
  unifiedSocialCreditIdentifierCode,

  /// Customs Registration Number
  @JsonValue('customs_registration_number')
  customsRegistrationNumber,

  /// National ID
  @JsonValue('national_id')
  nationalId,

  /// Drivers License
  @JsonValue('drivers_license')
  driversLicense,

  /// Passport Number
  @JsonValue('passport_number')
  passportNumber,

  /// Singapore GST Number
  @JsonValue('singapore_gst_number')
  singaporeGstNumber,

  /// Malaysia Low Value Registration Number
  @JsonValue('malaysia_low_value_registration_number')
  malaysiaLowValueRegistrationNumber,
}

/// API Field Structure:
/// ```
/// Attribute            Type      Description
/// tax_type           string    The type of tax number
/// tax_number         string    The tax number
/// ```
@JsonSerializable()
class TaxNumbers {
  /// Creates a new tax numbers instance
  TaxNumbers({
    required this.taxType,
    required this.taxNumber,
  });

  /// Creates a TaxNumbers from JSON
  factory TaxNumbers.fromJson(Map<String, dynamic> json) =>
      _$TaxNumbersFromJson(json);

  /// The type of tax number
  @JsonKey(name: 'tax_type')
  final TaxType taxType;

  /// The tax number
  @JsonKey(name: 'tax_number')
  final String taxNumber;

  /// Converts the TaxNumbers to JSON
  Map<String, dynamic> toJson() => _$TaxNumbersToJson(this);
}
