import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';

/// Handles all order-related API requests
class OrdersApi {
  /// Creates a new orders API instance
  OrdersApi({
    required String baseUrl,
    required Map<String, String> headers,
    required this.client,
  })  : _baseUrl = baseUrl,
        _headers = headers;

  final String _baseUrl;
  final Map<String, String> _headers;
  final http.Client client;

  /// Lists all unshipped orders
  ///
  /// By default, returns orders updated in the last 24 hours.
  /// Use [request] to customize the query parameters.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<ListUnshippedOrdersResponse> listUnshipped({
    ListUnshippedOrdersRequest? request,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/orders/unshipped').replace(
      queryParameters: request?.toQueryParameters(),
    );

    final response = await client.get(uri, headers: _headers);

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to list unshipped orders: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return ListUnshippedOrdersResponse.fromJson(json);
  }

  /// Lists orders by shipment status (recently printed or unmanifested)
  ///
  /// Use [request] to specify the status and customize other query parameters.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<ListShipmentsResponse> listShipments({
    required ListShipmentsRequest request,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/orders/shipments').replace(
      queryParameters: request.toQueryParameters(),
    );

    final response = await client.get(uri, headers: _headers);

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to list shipments: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return ListShipmentsResponse.fromJson(json);
  }

  /// Lists all shipped orders
  ///
  /// By default, returns orders updated in the last 24 hours.
  /// Use [request] to customize the query parameters.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<ListShippedOrdersResponse> listShipped({
    ListShippedOrdersRequest? request,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/orders/shipped').replace(
      queryParameters: request?.toQueryParameters(),
    );

    final response = await client.get(uri, headers: _headers);

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to list shipped orders: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return ListShippedOrdersResponse.fromJson(json);
  }

  /// Lists all delivered orders with a given order reference
  ///
  /// Use [request] to specify the order reference to filter by.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<ListDeliveredOrdersResponse> listDelivered({
    required ListDeliveredOrdersRequest request,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/orders/delivered').replace(
      queryParameters: request.toQueryParameters(),
    );

    final response = await client.get(uri, headers: _headers);

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to list delivered orders: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return ListDeliveredOrdersResponse.fromJson(json);
  }

  /// Lists order summaries with optional filtering and sorting
  ///
  /// By default, returns the first page of 100 orders sorted by order date descending.
  /// Use the [request] parameter to customize the query with filters, sorting, and pagination.
  Future<ListOrdersSummaryResponse> listSummary([
    ListOrdersSummaryRequest? request,
  ]) async {
    final uri = Uri.parse('$_baseUrl/api/orders/summary').replace(
      queryParameters: request?.toQueryParameters(),
    );

    final response = await client.get(uri, headers: _headers);
    if (response.statusCode != 200) {
      throw StarShipItException(
          'Failed to list order summaries: ${response.body}');
    }

    return ListOrdersSummaryResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Search orders based on a phrase, with optional filtering and pagination
  ///
  /// Returns a [SearchOrdersResponse] containing matching orders and pagination info
  Future<SearchOrdersResponse> search([SearchOrdersRequest? request]) async {
    final uri = Uri.parse('$_baseUrl/api/orders/search')
        .replace(queryParameters: request?.toQueryParameters());

    final response = await client.get(uri, headers: _headers);

    if (response.statusCode != 200) {
      throw StarShipItException('Failed to search orders: ${response.body}');
    }

    return SearchOrdersResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  /// Merges multiple unshipped orders into a single unshipped order
  ///
  /// The [request] parameter specifies the parent order ID and the list of child order IDs to merge.
  /// All orders must be unshipped for the merge to succeed.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<MergeOrdersResponse> merge(MergeOrdersRequest request) async {
    final uri = Uri.parse('$_baseUrl/api/orders/merge');

    final response = await client.post(
      uri,
      headers: _headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to merge orders: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return MergeOrdersResponse.fromJson(json);
  }

  /// Gets a list of unshipped orders that can be merged
  ///
  /// Returns orders where there are multiple orders going to the same person at the same address.
  /// Use [request] to customize pagination with limit and page parameters.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<GetMergeableOrdersResponse> getMergeable([
    GetMergeableOrdersRequest? request,
  ]) async {
    final uri = Uri.parse('$_baseUrl/api/orders/mergeable').replace(
      queryParameters: request?.toQueryParameters(),
    );

    final response = await client.get(uri, headers: _headers);

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to get mergeable orders: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return GetMergeableOrdersResponse.fromJson(json);
  }

  /// Assigns unshipped orders from one account to another
  ///
  /// The [request] parameter specifies the orders to assign and their source/destination API keys.
  /// Orders can be identified by either order_id or order_number.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<AssignOrdersResponse> assign(AssignOrdersRequest request) async {
    final uri = Uri.parse('$_baseUrl/api/orders/assign');

    final response = await client.post(
      uri,
      headers: _headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw StarShipItException(
        'Failed to assign orders: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return AssignOrdersResponse.fromJson(json);
  }
}
