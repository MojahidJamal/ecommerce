class ProductModel {
  late final String? name, image, description, color, size, price;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.color,
    required this.size,
    required this.price,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = map['color'];
    size = map['size'];
    price = map['price'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
    };
  }
}
