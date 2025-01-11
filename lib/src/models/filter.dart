import 'package:json_annotation/json_annotation.dart';
import 'filter_column.dart';
import 'filter_operator.dart';

part 'filter.g.dart';

/// Represents a filter in the StarShipIT API
///
/// Example filter strings:
/// - Order number: "Order:::1419"
/// - Name: "Name:::John Smith"
/// - Valid addresses: "Address:::valid"
/// - Date (with operator): "Date:::>=MAY 2024"
/// - Date (exact): "Date:::19 MAY 2024"
/// - Source (single): "Source:::25"
/// - Source (multiple): "Source:::25;26"
/// - State: "State:::NSW"
/// - Country: "Country:::Australia"
/// - Carrier: "Carrier:::StarTrack"
/// - Service: "Service:::EXP"
/// - Status: "Status:::Delivered"
/// - SKU: "SKU:::ABC123"
/// - Single SKU: "SingleSKU:::ABC123"
/// - Writeback: "Writeback:::Up to date"
/// - Weight (with operator): "Weight:::>=5"
/// - Weight (exact): "Weight:::5"
/// - Shipping Method: "ShippingMethod:::AusPost Express Intl"
/// - Shipping Description: "ShippingDescription:::Express"
/// - Tag: "Tag:::Urgent"
@JsonSerializable()
class Filter {
  /// Creates a new filter instance
  Filter({
    required this.column,
    required this.value,
    this.operator = FilterOperator.equals,
  });

  /// The column to filter on
  final FilterColumn column;

  /// The operator to use for comparison (only applicable for date and weight filters)
  final FilterOperator operator;

  /// The value to filter by
  final String value;

  /// Creates a Filter from JSON
  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  /// Converts the Filter to JSON
  Map<String, dynamic> toJson() => _$FilterToJson(this);

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write(column.name)
      ..write(':::');

    if (operator != FilterOperator.equals &&
        (column == FilterColumn.date || column == FilterColumn.weight)) {
      buffer.write(operator.name);
    }

    buffer.write(value);
    return buffer.toString();
  }

  /// Creates a Filter from a filter string
  ///
  /// The filter string should be in the format: "COLUMN:::VALUE" or
  /// "COLUMN:::OPERATORVALUE" for date and weight filters.
  ///
  /// Examples:
  /// - "Order:::1419"
  /// - "Date:::>=MAY 2024"
  /// - "Weight:::>=5"
  factory Filter.fromString(String filterString) {
    final parts = filterString.split(':::');
    if (parts.length != 2) {
      throw FormatException('Invalid filter string format: $filterString');
    }

    final column = FilterColumn.values.firstWhere(
      (c) =>
          c.toString().split('.').last.toLowerCase() == parts[0].toLowerCase(),
      orElse: () => throw FormatException('Invalid filter column: ${parts[0]}'),
    );

    var operator = FilterOperator.equals;
    var value = parts[1];

    if (column == FilterColumn.date || column == FilterColumn.weight) {
      for (final op in FilterOperator.values) {
        if (op != FilterOperator.equals && value.startsWith(op.name)) {
          operator = op;
          value = value.substring(op.name.length);
          break;
        }
      }
    }

    return Filter(
      column: column,
      operator: operator,
      value: value,
    );
  }
}
