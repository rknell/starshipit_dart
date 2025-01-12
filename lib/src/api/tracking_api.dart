import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import '../exceptions.dart';
import 'starshipit_http_client.dart';

/// API endpoints for tracking-related operations in the StarShipIT system.
///
/// The tracking API provides functionality to:
/// - Track shipments using tracking numbers or order numbers
/// - Get detailed tracking events and status updates
/// - Monitor shipment progress through carrier networks
/// - Create tracking-only orders for external shipments
class TrackingApi {
  /// Creates a new [TrackingApi] instance
  TrackingApi({
    required this.httpClient,
  });

  final StarshipitHttpClient httpClient;

  /// Gets tracking details for a shipment using either a tracking number or order number.
  ///
  /// Makes a GET request to `/api/track` to retrieve current tracking status and events.
  /// At least one of [trackingNumber] or [orderNumber] must be provided.
  ///
  /// Required headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: API key from Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key from Settings > API > Subscription key
  ///
  /// Parameters:
  /// - [trackingNumber] - Optional. The carrier's tracking number for the shipment
  /// - [orderNumber] - Optional. The order identifier from the source e-commerce platform
  ///
  /// Returns a [GetTrackingResponse] containing:
  /// - Order details (number, status, carrier info)
  /// - Tracking information (number, URL, status)
  /// - List of tracking events with timestamps and status updates
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<GetTrackingResponse> getTracking({
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

    final json = await httpClient.get(
      '/api/track',
      queryParameters: queryParams,
    );
    return GetTrackingResponse.fromJson(json);
  }

  /// Creates tracking-only orders for external shipments.
  ///
  /// Makes a POST request to `/api/orders/shipped` to create tracking-only orders.
  ///
  /// This endpoint allows you to add orders that were created and shipped outside of StarShipIT
  /// into the tracking system. This is useful for maintaining a centralized tracking hub for all
  /// orders, regardless of where they were created.
  ///
  /// [orders] - List of tracking only orders to create
  ///
  /// Returns a [CreateTrackingOnlyOrdersResponse] containing the created orders and their tracking numbers.
  ///
  /// Example:
  /// ```dart
  /// final response = await trackingApi.createTrackingOnlyOrders([
  ///   TrackingOnlyOrder(
  ///     name: 'John Smith',
  ///     orderNumber: 'ORD10001',
  ///     carrier: Carrier.ausPost,
  ///     trackingNumber: 'XYZ-92312-VSDV-24814',
  ///     country: 'Australia',
  ///     postcode: '2000',
  ///   ),
  /// ]);
  /// ```
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<CreateTrackingOnlyOrdersResponse> createTrackingOnlyOrders(
    List<TrackingOnlyOrder> orders,
  ) async {
    final response = await httpClient.post(
      '/api/orders/shipped',
      body: {'orders': orders.map((order) => order.toJson()).toList()},
    );
    return CreateTrackingOnlyOrdersResponse.fromJson(response);
  }
}
