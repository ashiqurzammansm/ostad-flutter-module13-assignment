class CartItem {
  String name;
  String color;
  String size;
  double price;
  int quantity;

  CartItem({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
  });
}
