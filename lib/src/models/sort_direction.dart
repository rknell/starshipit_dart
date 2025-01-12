import 'package:json_annotation/json_annotation.dart';

/// The direction to sort orders in
enum SortDirection {
  /// Sort in ascending order
  @JsonValue('Ascending')
  ascending,

  /// Sort in descending order
  @JsonValue('Descending')
  descending,
}
