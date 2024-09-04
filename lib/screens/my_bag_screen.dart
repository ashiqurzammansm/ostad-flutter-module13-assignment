import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../widgets/cart_item_widget.dart';

class MyBagScreen extends StatefulWidget {
  const MyBagScreen({super.key});

  @override
  MyBagScreenState createState() => MyBagScreenState();
}

class MyBagScreenState extends State<MyBagScreen> {
  // All items with respective image URLs
  List<CartItem> cartItems = [
    CartItem(
        name: 'Pullover',
        color: 'Black',
        size: 'L',
        price: 51.0,
        imageUrl: 'https://img.freepik.com/premium-photo/blank-black-tshirt-hanger-white-background_996201-2801.jpg?w=1380'),
    CartItem(
        name: 'T-Shirt',
        color: 'Gray',
        size: 'L',
        price: 30.0,
        imageUrl: 'https://img.freepik.com/free-photo/young-adult-pressing-buzzer-button_23-2149586599.jpg?t=st=1725483023~exp=1725486623~hmac=964585327e3fc734c95491b54933d2801b6c02649ffe8a3335bae4ed55fe232c&w=826'),
    CartItem(
        name: 'Sport Dress',
        color: 'Black',
        size: 'M',
        price: 43.0,
        imageUrl: 'https://img.freepik.com/premium-photo/highresolution-4k-white-tshirt-mockup-colorful-background-ideal-apparel-design-brandi_1193781-1729.jpg?w=1380'),
  ];

  // Calculate the total amount
  double get totalAmount {
    return cartItems.fold(
        0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  // Increment item quantity
  void incrementItem(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  // Decrement item quantity
  void decrementItem(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    item: cartItems[index],
                    onIncrement: () => incrementItem(index),
                    onDecrement: () => decrementItem(index),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total amount:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  const snackBar = SnackBar(
                    content: Text(
                        'Congratulations! You checked out successfully.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Button color
                ),
                child: const Text(
                  'CHECK OUT',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
