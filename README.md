# StarShipIt Dart

A Dart client library for interacting with the StarShipIt API, providing type-safe access to shipping and order management functionality.

## Features

- ✨ Full type safety with Dart 3.6+
- 🚀 Comprehensive API coverage
- 📦 JSON serialization with type checking
- 🧪 Test coverage for reliability
- 🔒 Proper error handling
- 📝 Well-documented API

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  starshipit_dart: ^1.0.0
```

## Usage

```dart
import 'package:starshipit_dart/starshipit_dart.dart';

void main() {
  // Initialize the client
  final client = StarShipIt(apiKey: 'your_api_key');

  // Create an order
  final order = await client.orders.create(
    CreateOrderRequest(
      orderNumber: 'ORD-123',
      orderDate: DateTime.now(),
      // ... other order details
    ),
  );

  // Get orders
  final orders = await client.orders.list(
    filter: 'unshipped',
    pageSize: 10,
  );
}
```

## Available Endpoints

- Orders Management
  - List Orders (Unshipped/Shipped/Delivered)
  - Create/Update Orders (Single and Bulk)
  - Delete/Archive/Restore Orders
  - Batch Update Orders
  - Get Order Details
  - Ship/Cancel Orders
  - Add Order Notes

## Requirements

- Dart 3.6+
- A StarShipIt API key

## Development

1. Clone the repository
2. Install dependencies:
   ```bash
   dart pub get
   ```
3. Generate JSON serialization code:
   ```bash
   ./tools/build_runner.sh
   ```
4. Run tests:
   ```bash
   dart test
   ```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- StarShipIt for their excellent API documentation
- The Dart team for their amazing work on the language and tools 