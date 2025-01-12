import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';
import 'starshipit_http_client.dart';

/// Handles all order-related API requests
class OrdersApi {
  /// Creates a new orders API instance
  OrdersApi({
    required this.httpClient,
  });

  final StarshipitHttpClient httpClient;

  /// Lists all unshipped orders
  ///
  /// By default, returns orders updated in the last 24 hours.
  /// Use [request] to customize the query parameters.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<ListUnshippedOrdersResponse> listUnshipped({
    ListUnshippedOrdersRequest? request,
  }) async {
    final json = await httpClient.get(
      '/api/orders/unshipped',
      queryParameters: request?.toQueryParameters(),
    );
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
    final json = await httpClient.get(
      '/api/orders/shipments',
      queryParameters: request.toQueryParameters(),
    );
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
    final json = await httpClient.get(
      '/api/orders/shipped',
      queryParameters: request?.toQueryParameters(),
    );
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
    final json = await httpClient.get(
      '/api/orders/delivered',
      queryParameters: request.toQueryParameters(),
    );
    return ListDeliveredOrdersResponse.fromJson(json);
  }

  /// Lists order summaries with optional filtering and sorting
  ///
  /// By default, returns the first page of 100 orders sorted by order date descending.
  /// Use the [request] parameter to customize the query with filters, sorting, and pagination.
  Future<ListOrdersSummaryResponse> listSummary([
    ListOrdersSummaryRequest? request,
  ]) async {
    final json = await httpClient.get(
      '/api/orders/summary',
      queryParameters: request?.toQueryParameters(),
    );
    return ListOrdersSummaryResponse.fromJson(json);
  }

  /// Search orders based on a phrase, with optional filtering and pagination
  ///
  /// Returns a [SearchOrdersResponse] containing matching orders and pagination info
  Future<SearchOrdersResponse> search([SearchOrdersRequest? request]) async {
    final json = await httpClient.get(
      '/api/orders/search',
      queryParameters: request?.toQueryParameters(),
    );
    return SearchOrdersResponse.fromJson(json);
  }

  /// Merges multiple unshipped orders into a single unshipped order
  ///
  /// The [request] parameter specifies the parent order ID and the list of child order IDs to merge.
  /// All orders must be unshipped for the merge to succeed.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<MergeOrdersResponse> merge(MergeOrdersRequest request) async {
    final json = await httpClient.post(
      '/api/orders/merge',
      body: request.toJson(),
    );
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
    final json = await httpClient.get(
      '/api/orders/mergeable',
      queryParameters: request?.toQueryParameters(),
    );
    return GetMergeableOrdersResponse.fromJson(json);
  }

  /// Assigns unshipped orders from one account to another
  ///
  /// The [request] parameter specifies the orders to assign and their source/destination API keys.
  /// Orders can be identified by either order_id or order_number.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<AssignOrdersResponse> assign(AssignOrdersRequest request) async {
    final json = await httpClient.post(
      '/api/orders/assign',
      body: request.toJson(),
    );
    return AssignOrdersResponse.fromJson(json);
  }

  /// Creates a new unshipped order
  ///
  /// The [request] parameter contains the order details including shipping information,
  /// destination details, and items to be shipped.
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<CreateOrdersResponse> create(CreateOrdersRequest request) async {
    final json = await httpClient.post(
      '/api/orders',
      body: request.toJson(),
    );
    return CreateOrdersResponse.fromJson(json);
  }
}
