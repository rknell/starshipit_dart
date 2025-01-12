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

  /// Prints a shipping label for a given order
  ///
  /// The [request] parameter specifies the order details and carrier information.
  /// The response includes base64 encoded label data that can be decoded to PDF.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<PrintLabelResponse> printLabel(PrintLabelRequest request) async {
    final json = await httpClient.post(
      '/api/orders/shipment',
      body: request.toJson(),
    );
    return PrintLabelResponse.fromJson(json);
  }

  /// Prints shipping labels for multiple orders
  ///
  /// The [request] parameter specifies the list of order IDs to print labels for.
  /// The response includes base64 encoded label data that can be decoded to PDF.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<PrintLabelsResponse> printLabels(PrintLabelsRequest request) async {
    final json = await httpClient.post(
      '/api/orders/shipments',
      body: request.toJson(),
    );
    return PrintLabelsResponse.fromJson(json);
  }

  /// Prints packing slips for single or multiple orders
  ///
  /// The [request] parameter specifies the list of order IDs to print packing slips for.
  /// Set [request.summary] to true to generate a packing summary that shows quantities of each SKU.
  /// The response includes base64 encoded PDF data that can be decoded to a printable document.
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

  /// Manifests printed orders with the courier service
  ///
  /// The [request] parameter specifies the list of printed order IDs to manifest.
  /// Manifesting will send the order details to your courier service for billing.
  /// The response includes base64 encoded PDF data for the manifest document.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<ManifestOrdersResponse> manifestOrders(
      ManifestOrdersRequest request) async {
    final json = await httpClient.post(
      '/api/orders/manifest',
      body: request.toJson(),
    );
    return ManifestOrdersResponse.fromJson(json);
  }

  /// Clones a printed or shipped order
  ///
  /// The [request] parameter specifies the order ID to clone and whether it should be a return shipment.
  /// Returns the full details of the cloned order.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<CloneShipmentResponse> cloneShipment(
      CloneShipmentRequest request) async {
    final json = await httpClient.post(
      '/api/orders/shipment/clone',
      body: request.toJson(),
    );
    return CloneShipmentResponse.fromJson(json);
  }

  /// Redoes a printed or shipped order
  ///
  /// The [request] parameter specifies the order ID to redo.
  /// Returns the full details of the replaced order.
  /// The original order will be archived.
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
