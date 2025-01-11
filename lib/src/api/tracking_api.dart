import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import '../exceptions.dart';

/// API endpoints for tracking-related operations
class TrackingApi {
  /// Creates a new [TrackingApi] instance
  TrackingApi({
    required String baseUrl,
    required Map<String, String> headers,
    required http.Client client,
  })  : _baseUrl = baseUrl,
        _headers = headers,
        _client = client;

  final String _baseUrl;
  final Map<String, String> _headers;
  final http.Client _client;

  /// Creates tracking-only orders for external shipments.
  ///
  /// This endpoint allows you to add orders that were created and shipped outside of StarShipIt
  /// into the tracking system. This is useful for maintaining a centralized tracking hub for all
  /// orders, regardless of where they were created.
  ///
  /// Example:
  /// ```dart
  /// final request = CreateTrackingOnlyOrdersRequest(
  ///   orders: [
  ///     TrackingOnlyOrder(
  ///       name: 'John Smith',
  ///       orderNumber: 'ORD10001',
  ///       carrier: Carrier.ausPost,
  ///       trackingNumber: 'XYZ-92312-VSDV-24814',
  ///       country: 'Australia',
  ///       postcode: '2000',
  ///     ),
  ///   ],
  /// );
  /// final response = await trackingApi.createTrackingOnlyOrders(request);
  /// ```
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<CreateTrackingOnlyOrdersResponse> createTrackingOnlyOrders(
    CreateTrackingOnlyOrdersRequest request,
  ) async {
    final uri = Uri.parse('$_baseUrl/api/orders/shipped');
    final response = await _client.post(
      uri,
      headers: _headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to create tracking-only orders: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return CreateTrackingOnlyOrdersResponse.fromJson(json);
  }
}
