import 'package:json_annotation/json_annotation.dart';

/// Represents the available carriers in the StarShipIT API
enum Carrier {
  /// NZ Post Domestic
  @JsonValue('CourierPost')
  courierPost,

  /// NZ Post International
  @JsonValue('NZPost')
  nzPost,

  /// DHL Express
  @JsonValue('DHL')
  dhl,

  /// Aramex
  @JsonValue('Fastways')
  fastways,

  /// Post Haste
  @JsonValue('PostHaste')
  postHaste,

  /// Castle Parcels
  @JsonValue('CastleParcels')
  castleParcels,

  /// NZ Couriers
  @JsonValue('NZCouriers')
  nzCouriers,

  /// NOW
  @JsonValue('NOW')
  now,

  /// Sub60
  @JsonValue('Sub60')
  sub60,

  /// Plain Label
  @JsonValue('PlainLabel')
  plainLabel,

  /// Australia Post
  @JsonValue('AusPost')
  ausPost,

  /// UPS ¬Æ
  @JsonValue('UPS')
  ups,

  /// Urgent
  @JsonValue('Urgent')
  urgent,

  /// DPD NL
  @JsonValue('DPDNL')
  dpdNl,

  /// PBT
  @JsonValue('PBT')
  pbt,

  /// Team Global Express Priority
  @JsonValue('TollPriority')
  tollPriority,

  /// DHL eCommerce Asia Pacific
  @JsonValue('DHLGlobalMail')
  dhlGlobalMail,

  /// CouriersPlease
  @JsonValue('CouriersPlease')
  couriersPlease,

  /// StarTrack
  @JsonValue('StarTrack')
  starTrack,

  /// NZ Post Express
  @JsonValue('Pace')
  pace,

  /// AusPost On Demand
  @JsonValue('StarTrackCourier')
  starTrackCourier,

  /// Team Global Express IPEC
  @JsonValue('TollIPEC')
  tollIpec,

  /// TNT
  @JsonValue('TNT')
  tnt,

  /// Sendle
  @JsonValue('Sendle')
  sendle,

  /// Hunter Express
  @JsonValue('HunterExpress')
  hunterExpress,

  /// Quantium Solutions
  @JsonValue('InXpress')
  inXpress,

  /// Quantium Solutions NZ
  @JsonValue('QuantiumSolutions')
  quantiumSolutions,

  /// Pickup In Store
  @JsonValue('PickupInStore')
  pickupInStore,

  /// Pack & Send
  @JsonValue('PackAndSend')
  packAndSend,

  /// Seko
  @JsonValue('Seko')
  seko,

  /// Zoom2u
  @JsonValue('Zoom2u')
  zoom2u,

  /// Quantium Solutions NZ
  @JsonValue('QuantiumSolutionsNZ')
  quantiumSolutionsNz,

  /// Plain Label 2
  @JsonValue('PlainLabel2')
  plainLabel2,

  /// Plain Label 3
  @JsonValue('PlainLabel3')
  plainLabel3,

  /// Plain Label 4
  @JsonValue('PlainLabel4')
  plainLabel4,

  /// Plain Label 5
  @JsonValue('PlainLabel5')
  plainLabel5,

  /// DHL Parcel Europe
  @JsonValue('DHLParcelEurope')
  dhlParcelEurope,

  /// DPD Local UK
  @JsonValue('DPDLocalUK')
  dpdLocalUk,

  /// DPD UK
  @JsonValue('DPDUK')
  dpdUk,

  /// Royal Mail
  @JsonValue('RoyalMail')
  royalMail,

  /// Deutsche Post
  @JsonValue('DeutschePost')
  deutschePost,

  /// USPS
  @JsonValue('USPS')
  usps,

  /// DHL US
  @JsonValue('DHLUS')
  dhlUs,

  /// Singapore Post
  @JsonValue('SingaporePost')
  singaporePost,

  /// DHL Parcel UK
  @JsonValue('DHLParcelUK')
  dhlParcelUk,

  /// Border Express
  @JsonValue('BorderExpress')
  borderExpress,

  /// Hermes
  @JsonValue('Hermes')
  hermes,

  /// MyPost Business
  @JsonValue('MyPostBusiness')
  myPostBusiness,

  /// Sherpa
  @JsonValue('Sherpa')
  sherpa,

  /// None
  @JsonValue('None')
  none,

  /// MyToll
  @JsonValue('MyToll')
  myToll,

  /// FedEx
  @JsonValue('FedEx')
  fedEx,

  /// Rendr
  @JsonValue('Rendr')
  rendr,

  /// Uber
  @JsonValue('Uber')
  uber,

  /// Direct Freight
  @JsonValue('DirectFreight')
  directFreight,

  /// Amazon partners (Amazon Easy Ship)
  @JsonValue('AmazonEasyShip')
  amazonEasyShip,

  /// Team Global Express NZ
  @JsonValue('TollNZ')
  tollNz,

  /// Allied Express
  @JsonValue('AlliedExpress')
  alliedExpress,

  /// Amazon Shipping
  @JsonValue('AmazonShipping')
  amazonShipping,

  /// MyNZPost Business
  @JsonValue('MyNZPostBusiness')
  myNzPostBusiness,

  /// Australia Post Mail
  @JsonValue('AusPostMail')
  ausPostMail,

  /// DHL Express Globalmail
  @JsonValue('DHLExpressGMB')
  dhlExpressGmb,

  /// FedEx International Connect
  @JsonValue('FedExInternationalConnect')
  fedExInternationalConnect,
}
