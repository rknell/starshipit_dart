/// Represents the possible tracking statuses for a shipment
enum TrackingStatus {
  /// Label has been printed but not yet dispatched
  printed('Printed'),

  /// Package has been dispatched
  dispatched('Dispatched'),

  /// Package is in transit
  inTransit('InTransit'),

  /// Package is out for delivery
  outForDelivery('OutForDelivery'),

  /// Package has been delivered
  delivered('Delivered'),

  /// Package is ready for pickup in store
  pickupInStore('PickupInStore'),

  /// Delivery was attempted but unsuccessful
  attemptedDelivery('AttemptedDelivery'),

  /// There was an exception during delivery
  exception('Exception'),

  /// Package is awaiting collection
  awaitingCollection('AwaitingCollection'),

  /// Delivery was cancelled
  cancelled('Cancelled');

  final String value;
  const TrackingStatus(this.value);

  factory TrackingStatus.fromString(String value) {
    return TrackingStatus.values.firstWhere(
      (status) => status.value.toLowerCase() == value.toLowerCase(),
      orElse: () => throw ArgumentError('Invalid tracking status: $value'),
    );
  }

  @override
  String toString() => value;
}
