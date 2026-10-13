import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        Theme.of(context)
            .colorScheme
            .inversePrimary,

        title: const Text(
          'Keranjang',
        ),
      ),

      body: const Center(
        child: Column(
          mainAxisSize:
          MainAxisSize.min,

          children: [
            Icon(
              Icons
                  .shopping_cart_outlined,
              size: 64,
              color: Colors.grey,
            ),

            SizedBox(height: 12),

            Text(
              'Keranjang belanja masih kosong.',

              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}