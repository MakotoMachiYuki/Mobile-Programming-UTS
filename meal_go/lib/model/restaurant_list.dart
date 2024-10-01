class RestaurantListModel {
  final int id;
  final String name;
  final String image;
  final double latitude;
  final double longitude;

  RestaurantListModel(
    this.id,
    this.name,
    this.image,
    this.latitude,
    this.longitude,
  );

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) =>
      other is RestaurantListModel && other.id == id;
}
