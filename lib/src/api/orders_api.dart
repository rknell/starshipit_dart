import 'package:starshipit/src/models/update_orders_response.dart';

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
  /// Get a list of all unshipped orders (default: orders updated in the last 24 hours)
  ///
  /// Endpoint: GET https://api.starshipit.com/api/orders/unshipped
  ///
  /// Parameters:
  /// - [since_order_date] (optional): Show orders created after date in UTC (date-time in RFC3339 format)
  /// - [since_last_updated] (optional): Show orders recently updated after date in UTC (date-time in RFC3339 format)
  /// - [ids_only] (optional): Show all unshipped order_ids only
  /// - [limit] (optional): Amount of results (default: 50) (maximum: 250)
  /// - [page] (optional): Page to show (default: 1)
  ///
  /// Response:
  /// - [orders]: List of unshipped orders details (Full Order Model)
  /// - [order_ids]: List of unshipped order_ids (only present if ids_only is set to true)
  /// - [total_pages]: Total number of pages available
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model) (only present if the request resulted in an error)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
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
  /// Get recently printed or unmanifested orders
  ///
  /// Endpoint: GET https://api.starshipit.com/api/orders/shipments?status=recently_printed
  ///
  /// Parameters:
  /// - [since_created_date] (optional): Show shipments created after date in UTC (date-time in RFC3339 format)
  /// - [status]: The status of the shipments to return (accepted values: recently_printed, unmanifested)
  /// - [limit] (optional): Amount of results (default: 50) (maximum: 250)
  /// - [page] (optional): Page to show (default: 1)
  ///
  /// Response:
  /// - [orders]: List of orders (Shipments Order Model)
  /// - [status]: Shipment status: recently_printed or unmanifested
  /// - [total_pages]: Total number of pages available
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
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
  /// Get a list of all shipped orders (default: orders updated in the last 24 hours)
  ///
  /// Endpoint: GET https://api.starshipit.com/api/orders/shipped
  ///
  /// Parameters:
  /// - [since_last_updated] (optional): Show orders recently updated after date in UTC (date-time in RFC3339 format)
  /// - [ids_only] (optional): Show all unshipped order_ids
  /// - [limit] (optional): Amount of results (default: 50) (maximum: 250)
  /// - [page] (optional): Page to show (default: 1)
  ///
  /// Response:
  /// - [orders]: List of shipped orders details (Full Order Model)
  /// - [order_ids]: List of shipped order_id
  /// - [total_pages]: Total number of pages available
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
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
  /// Get a list of all delivered orders with a given order reference
  ///
  /// Endpoint: GET https://api.starshipit.com/api/orders/delivered
  ///
  /// Parameters:
  /// - [order_ref]: The order reference to filter delivered orders by
  ///
  /// Response:
  /// - [orders]: List of shipped orders details (Full Order Model)
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
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

  /// Gets an order by its ID or order number
  ///
  /// [identifier] can be either an order ID or order number
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<GetOrdersResponse> getOrder(String identifier) async {
    final json = await httpClient.get('/api/orders/$identifier');
    return GetOrdersResponse.fromJson(json);
  }

  /// Gets multiple orders by their IDs or order numbers
  ///
  /// [request] contains a list of order IDs or order numbers to fetch
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<GetOrdersResponse> getOrders(GetOrdersRequest request) async {
    final json = await httpClient.post(
      '/api/orders/get',
      body: request.toJson(),
    );
    return GetOrdersResponse.fromJson(json);
  }

  /// Updates an existing order
  ///
  /// [identifier] can be either an order ID or order number
  /// [request] contains the updated order details
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<UpdateOrdersResponse> updateOrder(
    String identifier,
    UpdateOrderRequest request,
  ) async {
    final json = await httpClient.put(
      '/api/orders/$identifier',
      body: request.toJson(),
    );
    return UpdateOrdersResponse.fromJson(json);
  }

  /// Updates multiple orders in a single request
  ///
  /// [request] contains a list of orders to update
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<UpdateOrdersBulkResponse> updateOrders(
      UpdateOrdersBulkRequest request) async {
    final json = await httpClient.put(
      '/api/orders/bulk',
      body: request.toJson(),
    );
    return UpdateOrdersBulkResponse.fromJson(json);
  }

  /// Updates multiple orders with the same values
  ///
  /// [request] contains the order IDs/numbers to update and the values to apply to all orders
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<BatchUpdateOrdersResponse> updateBatch(
      BatchUpdateOrdersRequest request) async {
    final json = await httpClient.put(
      '/api/orders/batchupdate',
      body: request.toJson(),
    );
    return BatchUpdateOrdersResponse.fromJson(json);
  }

  /// Deletes an order
  ///
  /// [identifier] can be either an order ID or order number
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<DeleteOrderResponse> deleteOrder(String identifier) async {
    final json = await httpClient.delete('/api/orders/$identifier');
    return DeleteOrderResponse.fromJson(json);
  }

  /// Archives an order
  ///
  /// [identifier] can be either an order ID or order number
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<ArchiveOrderResponse> archiveOrder(String identifier) async {
    final json = await httpClient.post('/api/orders/$identifier/archive');
    return ArchiveOrderResponse.fromJson(json);
  }

  /// Restores a previously archived order
  ///
  /// [identifier] can be either an order ID or order number
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<RestoreOrderResponse> restoreOrder(String identifier) async {
    final json = await httpClient.post('/api/orders/$identifier/restore');
    return RestoreOrderResponse.fromJson(json);
  }
}
