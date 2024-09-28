class RestaurantListModel {
  final int id;
  final String name;
  final String image;
  // final String location;

  RestaurantListModel(
    this.id,
    this.name,
    this.image,
  );

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) =>
      other is RestaurantListModel && other.id == id;
}
