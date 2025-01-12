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
  /// Get a summary of orders by status
  ///
  /// Endpoint: GET https://api.starshipit.com/api/orders/summary
  ///
  /// Parameters:
  /// - [order_status]: Order status to show order summary of (accepted values: new, shipped, printed, archived)
  /// - [page]: Page number (accepted values: 1, 2, 3, ...)
  /// - [page_size]: Number of results to return (default: 500, maximum: 500) (accepted values: 1, 2, 3, ..., 500)
  /// - [filter]: See the Filters section on how to use this (example: "Order:::1419" or "Order:1419,Country:::Australia")
  /// - [sort]: Order field to sort by (accepted values: Address, Carrier, Name, Country, Date (order_date), Items,
  ///   Manifest (manifest_number), Order (order_number), Product, Quantity, ShippedDate, ShippingDescription,
  ///   ShippingMethod, SKU, StockOnHand, Platform, State, Status (order status), Weight, Writeback (writeback_status))
  /// - [sort_direction]: Sort Direction (accepted values: Ascending, Descending)
  ///
  /// Response:
  /// - [orders]: List of orders
  /// - [order_counts]: Stats on orders
  /// - [errors]: List of detailed errors (Error Model) (only present if the request resulted in an error)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
  ///
  /// Throws a [StarShipItException] if the request fails.
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
  /// Search printed order by order number, tracking number or name of the order
  ///
  /// Endpoint: GET https://api.starshipit.com/api/orders/search
  ///
  /// Parameters:
  /// - [phrase] (optional): In conjunction with the 'fields' parameter, this is the search phrase to search for
  /// - [limit] (optional): Amount of results (default: 50) (maximum: 250) (accepted values: 1, 2, 3, ..., 250)
  /// - [page] (optional): Page to show (default: 1) (accepted values: 1, 2, 3, ...)
  /// - [status] (optional): Returns a list of orders based on the order status (default: All) (accepted values: All, Unshipped, Shipped)
  /// - [fields] (optional): In conjunction with the phrase parameter, which field to search. If "All", it will search 'order number',
  ///   'tracking number', 'theirRef' and 'name' (accepted values: All, Order_Number, TheirRef)
  /// - [include_child_accounts]: If set to true, orders from child accounts will be returned (default: false) (accepted values: true, false)
  ///
  /// Response:
  /// - [orders]: List of order assignments (Search Order Model)
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
  /// Endpoint: POST https://api.starshipit.com/api/orders
  ///
  /// Request:
  /// - [order]: The order details object (Create Order Model)
  ///
  /// Response:
  /// - [order]: Created orders details (Full Order Model)
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<CreateOrdersResponse> create(CreateOrdersRequest request) async {
    final json = await httpClient.post(
      '/api/orders',
      body: request.toJson(),
    );
    return CreateOrdersResponse.fromJson(json);
  }

  /// Creates multiple unshipped orders in bulk (Maximum orders per API request: 50)
  ///
  /// Endpoint: POST https://api.starshipit.com/api/orders/import
  ///
  /// Request:
  /// - [orders]: List of orders details (Create Order Model)
  ///
  /// Response:
  /// - [orders]: List of created orders details (Full Order Model)
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<CreateOrdersResponse> import(CreateOrdersBulkRequest request) async {
    final json = await httpClient.post(
      '/api/orders/import',
      body: request.toJson(),
    );
    return CreateOrdersResponse.fromJson(json);
  }

  /// Get order details by either order_id or order_number. If neither order_id or order_number is provided,
  /// this endpoint can be used to return multiple orders that match the criteria.
  ///
  /// Endpoint: GET https://api.starshipit.com/api/orders
  ///
  /// Parameters:
  /// - [order_id] (optional): The unique numeric identifier for the order (example: 12345) (accepted values: Any integer)
  /// - [order_number] (optional): The identifier of the order pulled from source e-Commerce platform (example: #1234) (accepted values: Any)
  /// - [status] (optional): The order status to filter orders for (default: unshipped) (accepted values: Unshipped, Shipped)
  /// - [filter] (optional): See the Filters section on how to use this (example: Order:::#1234)
  /// - [include] (optional): Allows additional objects and values to be included in the response. To specify multiple inclusions,
  ///   just use multiple Include parameters (accepted values: Account_Summary, Shipment_Attributes, Sender_Details, Destination,
  ///   Items, Packages, Metadatas, Events, Shipping_Price)
  /// - [sort_column] (optional): Order field to sort by (accepted values: Address, Carrier, Name, Country, Date (order_date),
  ///   Items, Manifest (manifest_number), Order (order_number), Product, Quantity, ShippedDate, ShippingDescription,
  ///   ShippingMethod, SKU, StockOnHand, Platform, State, Status (order status), Weight, Writeback (writeback_status))
  /// - [sort_direction] (optional): Direction of the sort applied with sort_column (Default: Descending) (accepted values: Ascending, Descending)
  /// - [page_number] (optional): Page number to return (default: 1) (accepted values: Any integer)
  /// - [page_size] (optional): Number of results to return (default: 500, maximum: 500) (accepted values: 1, 2, 3, ... 500)
  ///
  /// Response:
  /// - [order]: List of order details (Full Order Model)
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<GetOrdersResponse> getOrder(String identifier) async {
    final request = GetOrdersRequest(
      orderId: int.tryParse(identifier),
      orderNumber: int.tryParse(identifier) == null ? identifier : null,
    );
    final json = await httpClient.get(
      '/api/orders',
      queryParameters: request.toQueryParameters(),
    );
    return GetOrdersResponse.fromJson(json);
  }

  /// Gets multiple orders by their IDs or order numbers
  ///
  /// Get order details by either order_id or order_number. If neither order_id or order_number is provided,
  /// this endpoint can be used to return multiple orders that match the criteria.
  ///
  /// Endpoint: GET https://api.starshipit.com/api/orders
  ///
  /// Parameters:
  /// - [order_id] (optional): The unique numeric identifier for the order (example: 12345) (accepted values: Any integer)
  /// - [order_number] (optional): The identifier of the order pulled from source e-Commerce platform (example: #1234) (accepted values: Any)
  /// - [status] (optional): The order status to filter orders for (default: unshipped) (accepted values: Unshipped, Shipped)
  /// - [filter] (optional): See the Filters section on how to use this (example: Order:::#1234)
  /// - [include] (optional): Allows additional objects and values to be included in the response. To specify multiple inclusions,
  ///   just use multiple Include parameters (accepted values: Account_Summary, Shipment_Attributes, Sender_Details, Destination,
  ///   Items, Packages, Metadatas, Events, Shipping_Price)
  /// - [sort_column] (optional): Order field to sort by (accepted values: Address, Carrier, Name, Country, Date (order_date),
  ///   Items, Manifest (manifest_number), Order (order_number), Product, Quantity, ShippedDate, ShippingDescription,
  ///   ShippingMethod, SKU, StockOnHand, Platform, State, Status (order status), Weight, Writeback (writeback_status))
  /// - [sort_direction] (optional): Direction of the sort applied with sort_column (Default: Descending) (accepted values: Ascending, Descending)
  /// - [page_number] (optional): Page number to return (default: 1) (accepted values: Any integer)
  /// - [page_size] (optional): Number of results to return (default: 500, maximum: 500) (accepted values: 1, 2, 3, ... 500)
  ///
  /// Response:
  /// - [order]: List of order details (Full Order Model)
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
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
  /// You can use the Update Order API to update order information. Different fields are available depending on
  /// the state of the order (i.e. once you have generated a label there is limited ability to modify the
  /// shipment details as they must be retained).
  ///
  /// For new/unshipped orders you can update all non read-only fields in the model (Update Order Model).
  /// For printed & shipped orders you can update:
  /// - Status (you can not update back to unshipped once printed)
  ///
  /// Endpoint: PUT https://api.starshipit.com/api/orders
  ///
  /// Request:
  /// - [order]: The order details object (Update Order Model)
  ///
  /// Response:
  /// - [order]: Updated orders details (Full Order Model)
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<UpdateOrdersResponse> updateOrder(UpdateOrderRequest request) async {
    final json = await httpClient.put(
      '/api/orders',
      body: request.toJson(),
    );
    return UpdateOrdersResponse.fromJson(json);
  }

  /// Updates multiple orders in a single request
  ///
  /// You can use the Update Orders API to update order information. Different fields are available depending on
  /// the state of the order (i.e. once you have generated a label there is limited ability to modify the
  /// shipment details as they must be retained).
  ///
  /// For new/unshipped orders you can update all non read-only fields in the model (Update Order Model).
  /// For printed & shipped orders you can update:
  /// - Status (you cannot update back to new/unshipped once printed)
  ///
  /// Endpoint: PUT https://api.starshipit.com/api/orders/update
  ///
  /// Request:
  /// - [orders]: List of orders details (Update Order Model)
  ///
  /// Response:
  /// - [orders]: List of updated orders details (Full Order Model)
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<UpdateOrdersBulkResponse> updateOrders(
      UpdateOrdersBulkRequest request) async {
    final json = await httpClient.put(
      '/api/orders/update',
      body: request.toJson(),
    );
    return UpdateOrdersBulkResponse.fromJson(json);
  }

  /// Updates multiple orders with the same values
  ///
  /// You can use the batch update order api to update the carrier information on a list of unshipped orders.
  /// You can update:
  /// - Product Code
  /// - Carrier Id
  ///
  /// Endpoint: PUT https://api.starshipit.com/api/orders/batchupdate
  ///
  /// Request:
  /// - [order_ids]: List of order_id to be updated
  /// - [product_code]: Carrier service code for delivery
  /// - [carrier_id]: The id of the carrier that is used in the order
  ///
  /// Response:
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
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

  /// Deletes an unshipped order
  ///
  /// Endpoint: DELETE https://api.starshipit.com/api/orders/delete
  ///
  /// Request:
  /// - [order_id]: The unique numeric identifier for the order
  ///
  /// Response:
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<DeleteOrderResponse> deleteOrder(String identifier) async {
    final orderId = int.tryParse(identifier);
    if (orderId == null) {
      throw StarShipItException('Invalid order ID: $identifier');
    }
    final request = DeleteOrderRequest(
      orderId: orderId,
    );
    final json = await httpClient.delete(
      '/api/orders/delete',
      queryParameters: request.toQueryParameters(),
    );
    return DeleteOrderResponse.fromJson(json);
  }

  /// Archives a printed/shipped order
  ///
  /// Endpoint: POST https://api.starshipit.com/api/orders/archive
  ///
  /// Request:
  /// - [order_id]: The unique numeric identifier for the order
  ///
  /// Response:
  /// - [success]: Determines whether the request was successfully submitted
  /// - [errors]: List of detailed errors (Error Model)
  ///
  /// Required Headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: Api key in your Starshipit account under Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key in your Starshipit account under Settings > API > Subscription key
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<ArchiveOrderResponse> archiveOrder(String identifier) async {
    final orderId = int.tryParse(identifier);
    if (orderId == null) {
      throw StarShipItException('Invalid order ID: $identifier');
    }
    final request = ArchiveOrderRequest(orderId: orderId);
    final json = await httpClient.post(
      '/api/orders/archive',
      queryParameters: request.toQueryParameters(),
    );
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
