import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';
import 'starshipit_http_client.dart';

/// Handles all shipping-related API requests
class ShippingApi {
  /// Creates a new shipping API instance
  ShippingApi({
    required this.httpClient,
  });

  final StarshipitHttpClient httpClient;

  /// Prints a shipping label for a given order.
  ///
  /// Makes a POST request to `/api/orders/shipment` to generate shipping labels.
  /// The response includes base64 encoded label data that can be decoded to PDF.
  ///
  /// Required headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: API key from Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key from Settings > API > Subscription key
  ///
  /// Parameters:
  /// - [request]: The [PrintLabelRequest] containing:
  ///   - orderId (optional): The unique numeric identifier for the order
  ///   - orderNumber (optional): The identifier of the order pulled from source e-Commerce platform
  ///   - carrier: The carrier that will be used when creating shipment
  ///   - carrierServiceCode: Carrier service code for delivery
  ///   - packages: Package list containing the parcel details with:
  ///     - weight (optional): Physical weight of the parcel in kilograms (kg)
  ///     - height (optional): Height of the parcel in meters (m)
  ///     - width (optional): Width of the parcel in meters (m)
  ///     - length (optional): Length of the parcel in meters (m)
  ///   - reprint: Returns labels previously generated for the printed order
  ///
  /// Returns a [PrintLabelResponse] containing:
  /// - orderId: The unique numeric identifier for the order
  /// - orderNumber: The identifier of the order pulled from source e-Commerce platform
  /// - carrierName: Name of the carrier used for shipment delivery
  /// - trackingNumbers: List of tracking numbers
  /// - labels: List of base64 strings which can be converted to PDF files for printing
  /// - labelTypes: List of label type codes which will match the label in order
  /// - success: Determines whether the request was successfully submitted
  /// - errors: List of detailed errors if the request was not successful
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<PrintLabelResponse> printLabel(PrintLabelRequest request) async {
    final json = await httpClient.post(
      '/api/orders/shipment',
      body: request.toJson(),
    );
    return PrintLabelResponse.fromJson(json);
  }

  /// Prints shipping labels for multiple orders.
  ///
  /// Makes a POST request to `/api/orders/shipments` to generate shipping labels.
  /// The response includes base64 encoded label data that can be decoded to PDF.
  ///
  /// Required headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: API key from Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key from Settings > API > Subscription key
  ///
  /// Parameters:
  /// - [request]: The [PrintLabelsRequest] containing:
  ///   - orderIds: List of unique numeric identifiers for the orders
  ///   - reprint: Returns labels previously generated for the printed orders
  ///
  /// Returns a [PrintLabelsResponse] containing:
  /// - labels: List of label files printed, each containing:
  ///   - labelType: Type of label name
  ///   - labelBase64String: base64 string which can be converted to PDF files for printing
  /// - success: Determines whether the request was successfully submitted
  /// - errors: List of detailed errors if the request was not successful
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<PrintLabelsResponse> printLabels(PrintLabelsRequest request) async {
    final json = await httpClient.post(
      '/api/orders/shipments',
      body: request.toJson(),
    );
    return PrintLabelsResponse.fromJson(json);
  }

  /// Prints packing slips for single or multiple orders.
  ///
  /// Makes a POST request to `/api/orders/packingslips` to generate packing slips.
  /// Can also generate a packing summary that shows quantities of each SKU.
  /// The response includes base64 encoded PDF data that can be decoded to a printable document.
  ///
  /// Required headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: API key from Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key from Settings > API > Subscription key
  ///
  /// Parameters:
  /// - [request]: The [PrintPackingSlipsRequest] containing:
  ///   - orderIds: List of order IDs to print packing slips for
  ///   - summary: Set to true to generate a packing summary showing quantities of each SKU
  ///
  /// Returns a [PrintPackingSlipsResponse] containing:
  /// - labelType: Type of label name
  /// - pdf: Base64 string which can be converted to a PDF file for printing
  /// - success: Determines whether the request was successfully submitted
  /// - errors: List of detailed errors if the request was not successful
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<PrintPackingSlipsResponse> printPackingSlips(
    PrintPackingSlipsRequest request,
  ) async {
    final json = await httpClient.post(
      '/api/orders/packingslips',
      body: request.toJson(),
    );
    return PrintPackingSlipsResponse.fromJson(json);
  }

  /// Finalise and manifest your printed orders.
  ///
  /// Makes a POST request to `/api/orders/manifest` to send order details to your courier service for billing.
  /// The response includes base64 encoded PDF data that can be decoded to a printable document.
  ///
  /// Required headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: API key from Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key from Settings > API > Subscription key
  ///
  /// Parameters:
  /// - [request]: The [ManifestOrdersRequest] containing:
  ///   - orderIds: List of printed order IDs to manifest
  ///
  /// Returns a [ManifestOrdersResponse] containing:
  /// - labelType: Type of label name
  /// - pdf: Base64 string which can be converted to PDF files for printing
  /// - success: Determines whether the request was successfully submitted
  /// - errors: List of detailed errors if the request was not successful
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<ManifestOrdersResponse> manifestOrders(
    ManifestOrdersRequest request,
  ) async {
    final json = await httpClient.post(
      '/api/orders/manifest',
      body: request.toJson(),
    );
    return ManifestOrdersResponse.fromJson(json);
  }

  /// Clones a printed or shipped order.
  ///
  /// Makes a POST request to `/api/orders/shipment/clone` to create a copy of an existing order.
  /// The cloned order will have a new order ID but retain all other details from the original order.
  ///
  /// Required headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: API key from Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key from Settings > API > Subscription key
  ///
  /// Parameters:
  /// - [request]: The [CloneShipmentRequest] containing:
  ///   - orderId: The shipped or printed order ID to clone
  ///   - toReturnShipment (optional): Determines whether the clone is for a return order
  ///
  /// Returns a [CloneShipmentResponse] containing:
  /// - order: The details of the cloned order (Full Order Model)
  /// - success: Determines whether the request was successfully submitted
  /// - errors: List of detailed errors if the request was not successful
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<CloneShipmentResponse> cloneShipment(
    CloneShipmentRequest request,
  ) async {
    final json = await httpClient.post(
      '/api/orders/shipment/clone',
      body: request.toJson(),
    );
    return CloneShipmentResponse.fromJson(json);
  }

  /// Redoes a printed or shipped order.
  ///
  /// Makes a POST request to `/api/orders/shipment/replace` to create a new order from an existing one.
  /// The original order will be archived and a new order will be created with a new order ID.
  ///
  /// Required headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: API key from Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key from Settings > API > Subscription key
  ///
  /// Parameters:
  /// - [request]: The [ReplaceShipmentRequest] containing:
  ///   - orderId: The shipped or printed order ID to redo
  ///
  /// Returns a [ReplaceShipmentResponse] containing:
  /// - order: The details of the replaced order (Full Order Model)
  /// - success: Determines whether the request was successfully submitted
  /// - errors: List of detailed errors if the request was not successful
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<ReplaceShipmentResponse> replaceShipment(
    ReplaceShipmentRequest request,
  ) async {
    final json = await httpClient.post(
      '/api/orders/shipment/replace',
      body: request.toJson(),
    );
    return ReplaceShipmentResponse.fromJson(json);
  }
}
