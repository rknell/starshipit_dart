import 'package:json_annotation/json_annotation.dart';

/// Represents comparison operators used in filters
enum FilterOperator {
  /// Greater than or equal to (>=)
  @JsonValue('>=')
  greaterThanOrEqual,

  /// Greater than (>)
  @JsonValue('>')
  greaterThan,

  /// Less than or equal to (<=)
  @JsonValue('<=')
  lessThanOrEqual,

  /// Less than (<)
  @JsonValue('<')
  lessThan,

  /// Equals (exact match)
  @JsonValue('')
  equals,
}
