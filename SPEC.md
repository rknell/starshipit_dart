# StarShipIt Dart Client

## Handover Instructions

### Current Status
- All core models are implemented and documented
- Basic CRUD operations for orders are complete
- JSON serialization is set up with build_runner
- Remaining endpoints focus on specific order operations (get by ID/reference, ship, cancel, notes)

### Implementation Patterns
1. For each endpoint:
   - Create request/response wrappers in `lib/src/models/`
   - Follow existing naming convention: `{action}_order_request.dart` and `{action}_order_response.dart`
   - Use `@JsonSerializable()` with existing models where possible
   - Add query parameter conversion for GET/DELETE endpoints
   - Document all fields and methods

2. Common Model Patterns:
   - Request models: Convert IDs to strings in query parameters
   - Response models: Always include `success` and optional `errors`
   - Bulk operations: Use List<T> for multiple items
   - Error handling: Use existing `StarShipItError` model

3. Code Generation:
   - Run `./tools/build_runner.sh` after creating/modifying models
   - Fix any version constraints warnings if they appear
   - Verify generated `.g.dart` files are created

### Review Guidelines
When reviewing new endpoint implementations, check:
1. Model Structure:
   - Correct field types and nullability
   - Proper JSON key annotations
   - Documentation for all public members
   - Query parameter conversion where needed

2. Consistency:
   - Follows established patterns from existing endpoints
   - Uses appropriate existing models (FullOrder, StarShipItError, etc.)
   - Maintains consistent error handling

3. Documentation:
   - Updates SPEC.md with new models and endpoints
   - Documents implementation steps
   - Marks progress in tracking section

4. Code Quality:
   - No linter errors remain
   - JSON serialization is properly set up
   - Follows project's technical requirements

This document outlines the specifications and progress of the StarShipIt API client implementation in Dart.

## Project Overview

A Dart client library for interacting with the StarShipIt API, providing type-safe access to shipping and order management functionality.

## Technical Requirements

- Dart 3.6+
- json_serializable with explicitToJson enabled project-wide
- GetIt for dependency injection
- Comprehensive test coverage
- Proper error handling and type safety

## API Models

### Core Models
- ✓ StarShipItError - Base error handling model
- ✓ SenderDetails - Sender information model
- ✓ DestinationDetails - Destination information model
- ✓ Order Models:
  - `FullOrder` - Complete order details model
  - `OrderSummary` - Summary order information
  - `SearchOrder` - Search result order model
  - `ShipmentsOrder` - Shipping-focused order model
  - `CreateOrderRequest` - Model for creating new orders
  - `UpdateOrderRequest` - Model for updating orders
- ✓ OrderItem - Order item details
- ✓ Package - Package information

### Request/Response Models
- ✓ GetOrdersRequest
  - Includes filters, pagination, sorting
  - Supports order status filtering
  - Includes enums for OrderStatus, OrderInclude, OrderSortColumn, SortDirection
- ✓ GetOrdersResponse
- ✓ CreateOrdersRequest
  - Contains CreateOrderRequest model for order details
- ✓ CreateOrdersResponse
  - Contains FullOrder model for created order details
- ✓ CreateOrdersBulkRequest
  - Contains list of CreateOrderRequest models (max: 50)
- ✓ CreateOrdersBulkResponse
  - Contains list of FullOrder models for created orders
- ✓ UpdateOrdersRequest
  - Contains UpdateOrderRequest model for order details
- ✓ UpdateOrdersResponse
  - Contains FullOrder model for updated order details
- ✓ UpdateOrdersBulkRequest
  - Contains list of UpdateOrderRequest models
- ✓ UpdateOrdersBulkResponse
  - Contains list of FullOrder models for updated orders
- ✓ BatchUpdateOrdersRequest
  - Contains list of order IDs and carrier information
- ✓ BatchUpdateOrdersResponse
  - Contains success status and optional errors
- ✓ DeleteOrderRequest
  - Contains order ID for deletion
- ✓ DeleteOrderResponse
  - Contains success status and optional errors
- ✓ ArchiveOrderRequest
  - Contains order ID for archiving
- ✓ ArchiveOrderResponse
  - Contains success status and optional errors
- ✓ RestoreOrderRequest
  - Contains order ID for restoration
- ✓ RestoreOrderResponse
  - Contains success status and optional errors
- ✓ ListUnshippedOrdersResponse
- ✓ ListShippedOrdersResponse
- ✓ ListDeliveredOrdersResponse

### Tracking Only Orders
- ✓ TrackingOnlyOrder - Model for external shipments with tracking
- ✓ CreateTrackingOnlyOrdersRequest - Request model for creating tracking-only orders
- ✓ CreateTrackingOnlyOrdersResponse - Response model for tracking-only order creation

## API Endpoints Implementation Status

### Orders
- ✓ List Unshipped Orders
- ✓ List Shipped Orders
- ✓ List Delivered Orders
- ✓ Get Orders
  - Implementation Steps:
    1. Create request wrapper (`GetOrdersRequest`) using:
       - Optional parameters: `order_id`, `order_number`, `status`, `filter`, `include`, `sort_column`, `sort_direction`, `page_number`, `page_size`
       - Existing enums for type-safe parameters:
         - `OrderStatus` (Unshipped, Shipped)
         - `OrderInclude` (Account_Summary, Shipment_Attributes, etc.)
         - `OrderSortColumn` (Address, Carrier, Name, etc.)
         - `SortDirection` (Ascending, Descending)
       - Query parameter conversion method
    2. Create response wrapper (`GetOrdersResponse`) using:
       - Existing `FullOrder` model for order details
       - Existing `StarShipItError` for error handling
       - Required fields: `order` (List<FullOrder>), `success` (bool)
       - Optional field: `errors` (List<StarShipItError>)
    3. Enable JSON serialization:
       - Add `@JsonSerializable()` annotations
       - Create part files
       - Run build_runner to generate serialization code
- ✓ Create Order
  - Implementation Steps:
    1. Create request wrapper (`CreateOrdersRequest`) using:
       - Existing `CreateOrderRequest` model for order details
       - Contains order date, number, reference, shipping details, destination, and items
    2. Create response wrapper (`CreateOrdersResponse`) using:
       - Existing `FullOrder` model for created order details
       - Existing `StarShipItError` for error handling
       - Required fields: `order` (FullOrder), `success` (bool)
       - Optional field: `errors` (List<StarShipItError>)
    3. Enable JSON serialization:
       - Add `@JsonSerializable()` annotations
       - Create part files
       - Run build_runner to generate serialization code
- ✓ Create Orders (Bulk)
  - Implementation Steps:
    1. Create request wrapper (`CreateOrdersBulkRequest`) using:
       - List of existing `CreateOrderRequest` models for order details
       - Assert maximum of 50 orders per request
    2. Create response wrapper (`CreateOrdersBulkResponse`) using:
       - List of existing `FullOrder` models for created orders
       - Existing `StarShipItError` for error handling
       - Required fields: `orders` (List<FullOrder>), `success` (bool)
       - Optional field: `errors` (List<StarShipItError>)
    3. Enable JSON serialization:
       - Add `@JsonSerializable()` annotations
       - Create part files
       - Run build_runner to generate serialization code
- ✓ Update Order
  - Implementation Steps:
    1. Create request wrapper (`UpdateOrdersRequest`) using:
       - Existing `UpdateOrderRequest` model for order details
       - Contains all updatable fields based on order state
       - For unshipped orders: all non read-only fields
       - For printed/shipped orders: only status field
    2. Create response wrapper (`UpdateOrdersResponse`) using:
       - Existing `FullOrder` model for updated order details
       - Existing `StarShipItError` for error handling
       - Required fields: `order` (FullOrder), `success` (bool)
       - Optional field: `errors` (List<StarShipItError>)
    3. Enable JSON serialization:
       - Add `@JsonSerializable()` annotations
       - Create part files
       - Run build_runner to generate serialization code
- ✓ Update Orders (Bulk)
  - Implementation Steps:
    1. Create request wrapper (`UpdateOrdersBulkRequest`) using:
       - List of existing `UpdateOrderRequest` models for order details
       - Contains all updatable fields based on order state
       - For unshipped orders: all non read-only fields
       - For printed/shipped orders: only status field
    2. Create response wrapper (`UpdateOrdersBulkResponse`) using:
       - List of existing `FullOrder` models for updated orders
       - Existing `StarShipItError` for error handling
       - Required fields: `orders` (List<FullOrder>), `success` (bool)
       - Optional field: `errors` (List<StarShipItError>)
    3. Enable JSON serialization:
       - Add `@JsonSerializable()` annotations
       - Create part files
       - Run build_runner to generate serialization code
- ✓ Batch Update Orders
  - Implementation Steps:
    1. Create request wrapper (`BatchUpdateOrdersRequest`) using:
       - Required fields:
         - `order_ids` (List<int>) - List of order IDs to update
         - `product_code` (String) - Carrier service code for delivery
         - `carrier_id` (String) - ID of the carrier to use
       - Focused on updating carrier information for unshipped orders
    2. Create response wrapper (`BatchUpdateOrdersResponse`) using:
       - Required field: `success` (bool)
       - Optional field: `errors` (List<StarShipItError>)
       - Simple response indicating success or failure
    3. Enable JSON serialization:
       - Add `@JsonSerializable()` annotations
       - Create part files
       - Run build_runner to generate serialization code
- ✓ Delete Order
  - Implementation Steps:
    1. Create request wrapper (`DeleteOrderRequest`) using:
       - Required field: `order_id` (int) - The unique numeric identifier for the order
       - Method to convert to query parameters for DELETE request
       - Only works for unshipped orders
    2. Create response wrapper (`DeleteOrderResponse`) using:
       - Required field: `success` (bool)
       - Optional field: `errors` (List<StarShipItError>)
       - Simple response indicating success or failure
    3. Enable JSON serialization:
       - Add `@JsonSerializable()` annotations
       - Create part files
       - Run build_runner to generate serialization code
- ✓ Archive Order
  - Implementation Steps:
    1. Create request wrapper (`ArchiveOrderRequest`) using:
       - Required field: `order_id` (int) - The unique numeric identifier for the order
       - Method to convert to query parameters for POST request
       - Only works for printed/shipped orders
    2. Create response wrapper (`ArchiveOrderResponse`) using:
       - Required field: `success` (bool)
       - Optional field: `errors` (List<StarShipItError>)
       - Simple response indicating success or failure
    3. Enable JSON serialization:
       - Add `@JsonSerializable()` annotations
       - Create part files
       - Run build_runner to generate serialization code
- ✓ Restore Order
  - Implementation Steps:
    1. Create request wrapper (`RestoreOrderRequest`) using:
       - Required field: `order_id` (int) - The unique numeric identifier for the order
       - Method to convert to query parameters for POST request
       - Only works for archived orders
    2. Create response wrapper (`RestoreOrderResponse`) using:
       - Required field: `success` (bool)
       - Optional field: `errors` (List<StarShipItError>)
       - Simple response indicating success or failure
    3. Enable JSON serialization:
       - Add `@JsonSerializable()` annotations
       - Create part files
       - Run build_runner to generate serialization code

### Tracking
- ✓ Create Tracking Only Orders
  - Implementation Steps:
    1. Create request wrapper (`CreateTrackingOnlyOrdersRequest`) using:
       - Required field: `orders` (List<TrackingOnlyOrder>)
       - Each order contains:
         - `name` (optional) - Customer name
         - `order_number` (optional) - Reference number
         - `carrier` - Carrier enum value
         - `tracking_number` - Shipment tracking number
         - `country` - Destination country
         - `postcode` - Destination postcode
    2. Create response wrapper (`CreateTrackingOnlyOrdersResponse`) using:
       - Required fields:
         - `orders` (Map<String, String>) - Map of order IDs to tracking numbers
         - `success` (bool) - Whether the request was successful
    3. Enable JSON serialization:
       - Add `@JsonSerializable()` annotations
       - Create part files
       - Run build_runner to generate serialization code
       - Implement API endpoint in `TrackingApi` class:
         - POST request to `/api/orders/shipped`
         - Handle error responses
         - Parse response into `CreateTrackingOnlyOrdersResponse`

### Remaining Endpoints to Implement
- Get Order by ID
- Get Order by Reference
- Ship Order
- Cancel Order
- Add Order Note

## Implementation Guidelines

1. All models should use json_serializable with explicitToJson = true
2. Implement proper error handling using StarShipItError
3. Maintain consistent naming conventions
4. Document all public APIs
5. Write unit tests for each new feature
6. Follow REST best practices for endpoint implementation

## Testing Requirements

- Unit tests for all models
- Integration tests for API endpoints
- Mock responses for testing
- Error handling test cases

## Documentation Requirements

- Public API documentation
- Usage examples
- Error handling guidelines
- Authentication setup instructions

## Project Structure

```
lib/
  src/
    models/           # Data models
    api/             # API client implementation
    exceptions/      # Custom exceptions
    utils/          # Utility functions
test/
  models/           # Model tests
  api/             # API tests
```

## Progress Tracking

- [x] Project setup
- [x] Core models implementation
- [x] Basic API client structure
- [x] Order listing endpoints
- [x] Get Orders endpoint
- [x] Create Order endpoint
- [x] Create Orders (Bulk) endpoint
- [x] Update Order endpoint
- [x] Update Orders (Bulk) endpoint
- [x] Batch Update Orders endpoint
- [x] Delete Order endpoint
- [x] Archive Order endpoint
- [x] Restore Order endpoint
- [ ] Remaining CRUD operations
- [ ] Documentation
- [ ] Test coverage 