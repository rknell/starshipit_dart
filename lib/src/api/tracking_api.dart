import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models.dart';
import '../exceptions.dart';

/// API for tracking shipments
class TrackingApi {
  final String _baseUrl;
  final Map<String, String> _headers;
  final http.Client _client;

  /// Creates a new [TrackingApi] instance
  TrackingApi(this._baseUrl, this._headers, this._client);

  /// Get tracking details using a tracking number or order number
  ///
  /// Either [trackingNumber] or [orderNumber] must be provided.
  /// Returns tracking details for the shipment.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<TrackingResponse> getTracking({
    String? trackingNumber,
    String? orderNumber,
  }) async {
    if (trackingNumber == null && orderNumber == null) {
      throw ArgumentError(
          'Either trackingNumber or orderNumber must be provided');
    }

    final queryParams = <String, String>{};
    if (trackingNumber != null) {
      queryParams['tracking_number'] = trackingNumber;
    }
    if (orderNumber != null) {
      queryParams['order_number'] = orderNumber;
    }

    final uri =
        Uri.parse('$_baseUrl/api/track').replace(queryParameters: queryParams);

    final response = await _client.get(uri, headers: _headers);

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to get tracking details: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return TrackingResponse.fromJson(json);
  }
}
