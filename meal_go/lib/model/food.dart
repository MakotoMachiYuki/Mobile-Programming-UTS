class Food {
  final int id;
  final String name;
  final String image;
  final int price;

  Food(this.id, this.name, this.image, this.price);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Food && other.id == id;
}
