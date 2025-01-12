import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import '../exceptions.dart';
import 'starshipit_http_client.dart';

/// API endpoints for tracking-related operations
class TrackingApi {
  /// Creates a new [TrackingApi] instance
  TrackingApi({
    required this.httpClient,
  });

  final StarshipitHttpClient httpClient;

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
    final json = await httpClient.post(
      '/api/orders/shipped',
      body: request.toJson(),
    );
    return CreateTrackingOnlyOrdersResponse.fromJson(json);
  }
}
