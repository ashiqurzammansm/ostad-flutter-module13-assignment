import 'package:flutter/material.dart';
import 'screens/my_bag_screen.dart';

void main() {
  runApp(const ShoppingBagApp());
}

class ShoppingBagApp extends StatelessWidget {
  const ShoppingBagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBagScreen(),
    );
  }
}
