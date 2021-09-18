
class CartProductModel {
  late final String? name, image, price;
  late int quantity;

  CartProductModel({
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}
