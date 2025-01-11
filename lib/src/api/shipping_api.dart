import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';

/// Handles all shipping-related API requests
class ShippingApi {
  /// Creates a new shipping API instance
  ShippingApi({
    required String baseUrl,
    required Map<String, String> headers,
    required http.Client client,
  })  : _baseUrl = baseUrl,
        _headers = headers,
        _client = client;

  final String _baseUrl;
  final Map<String, String> _headers;
  final http.Client _client;

  /// Prints a shipping label for a given order
  ///
  /// The [request] parameter specifies the order details and carrier information.
  /// The response includes base64 encoded label data that can be decoded to PDF.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<PrintLabelResponse> printLabel(PrintLabelRequest request) async {
    final uri = Uri.parse('$_baseUrl/api/orders/shipment');

    final response = await _client.post(
      uri,
      headers: _headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to print label: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return PrintLabelResponse.fromJson(json);
  }

  /// Prints shipping labels for multiple orders
  ///
  /// The [request] parameter specifies the list of order IDs to print labels for.
  /// The response includes base64 encoded label data that can be decoded to PDF.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<PrintLabelsResponse> printLabels(PrintLabelsRequest request) async {
    final uri = Uri.parse('$_baseUrl/api/orders/shipments');

    final response = await _client.post(
      uri,
      headers: _headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to print labels: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
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
    final uri = Uri.parse('$_baseUrl/api/orders/packingslips');

    final response = await _client.post(
      uri,
      headers: _headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to print packing slips: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
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
    final uri = Uri.parse('$_baseUrl/api/orders/manifest');

    final response = await _client.post(
      uri,
      headers: _headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to manifest orders: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
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
    final uri = Uri.parse('$_baseUrl/api/orders/shipment/clone');

    final response = await _client.post(
      uri,
      headers: _headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to clone shipment: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
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
    final uri = Uri.parse('$_baseUrl/api/orders/shipment/replace');

    final response = await _client.post(
      uri,
      headers: _headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to replace shipment: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return ReplaceShipmentResponse.fromJson(json);
  }
}
