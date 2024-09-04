import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemWidget({super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              'https://via.placeholder.com/80', // Placeholder for product image
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Color: ${item.color}'),
                  Text('Size: ${item.size}'),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: item.quantity > 1 ? onDecrement : null,
                    ),
                    Text(item.quantity.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: onIncrement,
                    ),
                  ],
                ),
                Text('\$${item.price.toStringAsFixed(2)}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
