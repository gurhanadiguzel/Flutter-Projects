class Outfit {
  final String name;
  final String color;
  final String brand;
  final String price;

  Outfit(this.name, this.color, this.brand, this.price);

  @override
  String toString() {
    return ' Name : $name \n Color : $color \n Brand : $brand \n price : $price \n\n';
  }
}
