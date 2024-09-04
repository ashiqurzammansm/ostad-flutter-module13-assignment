class CartItem {
  String name;
  String color;
  String size;
  double price;
  int quantity;
  String imageUrl;

  CartItem({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });
}
