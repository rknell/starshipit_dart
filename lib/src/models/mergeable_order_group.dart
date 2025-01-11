import 'package:json_annotation/json_annotation.dart';
import 'mergeable_order.dart';

part 'mergeable_order_group.g.dart';

/// Represents a group of orders that can be merged together
@JsonSerializable()
class MergeableOrderGroup {
  /// The Starshipit order_id of the potential 'master' order
  final int primaryOrderId;

  /// A list of all mergeable orders, including the 'master' order
  final List<MergeableOrder> orders;

  /// Creates a new [MergeableOrderGroup] instance
  const MergeableOrderGroup({
    required this.primaryOrderId,
    required this.orders,
  });

  /// Creates a [MergeableOrderGroup] from JSON data
  factory MergeableOrderGroup.fromJson(Map<String, dynamic> json) =>
      _$MergeableOrderGroupFromJson(json);

  /// Converts this [MergeableOrderGroup] into JSON data
  Map<String, dynamic> toJson() => _$MergeableOrderGroupToJson(this);
}
