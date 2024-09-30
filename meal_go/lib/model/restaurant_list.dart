class RestaurantListModel {
  final int id;
  final String name;
  final String image;
  final double lat;
  final double lng;

  RestaurantListModel(
    this.id,
    this.name,
    this.image,
    this.lat,
    this.lng,
  );

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) =>
      other is RestaurantListModel && other.id == id;
}
