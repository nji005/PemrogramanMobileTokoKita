import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Product> products = [
    Product(
      id: 1,
      name: 'Kemeja Flanel Kasual',
      price: 150000,
      imageUrl: 'assets/kemeja.jpg',
      category: 'Fashion',
      stock: 25,
      description: 'Bahan katun adem.',
    ),

    Product(
      id: 2,
      name: 'Wireless Headset BT',
      price: 320000,
      imageUrl: 'assets/headset.jpg',
      category: 'Elektronik',
      stock: 12,
      description: 'Baterai tahan hingga 24 jam.',
    ),

    DiscountedProduct(
      id: 3,
      name: 'Smartwatch Sport Fit',
      price: 499000,
      imageUrl: 'assets/watch.jpg',
      category: 'Elektronik',
      stock: 4,
      description: 'Anti-air dan sensor detak jantung.',
      discountPercent: 20,
    ),

    Product(
      id: 4,
      name: 'Kaos Polos Katun',
      price: 65000,
      imageUrl: 'assets/kaos.jpg',
      category: 'Fashion',
      stock: 0,
      description: null,
    ),

    Product(
      id: 5,
      name: 'Mouse Wireless Silent',
      price: 125000,
      imageUrl: 'assets/mouse.jpg',
      category: 'Elektronik',
      stock: 18,
      description: 'Sensor presisi tinggi.',
    ),

    Product(
      id: 6,
      name: 'Kopi Arabika Gayo 250g',
      price: 75000,
      imageUrl: 'assets/kopi.jpg',
      category: 'Makanan',
      stock: 30,
      description: 'Aroma sangrai harum.',
    ),

    Product(
      id: 7,
      name: 'Keripik Tempe Renyah',
      price: 25000,
      imageUrl: 'assets/keripik.jpg',
      category: 'Makanan',
      stock: 5,
      description: null,
    ),

    DiscountedProduct(
      id: 8,
      name: 'Tas Ransel Laptop',
      price: 275000,
      imageUrl: 'assets/tas.jpg',
      category: 'Fashion',
      stock: 9,
      description: 'Bahan tahan air dan muat laptop 15 inci.',
      discountPercent: 15,
    ),

    Product(
      id: 9,
      name: 'Celana Jeans Slim Fit',
      price: 225000,
      imageUrl: 'assets/jeans.jpg',
      category: 'Fashion',
      stock: 14,
      description: 'Celana jeans model slim fit.',
    ),

    Product(
      id: 10,
      name: 'Keyboard Mechanical',
      price: 450000,
      imageUrl: 'assets/keyboard.jpg',
      category: 'Elektronik',
      stock: 8,
      description: 'Keyboard mechanical untuk bekerja dan gaming.',
    ),

    DiscountedProduct(
      id: 11,
      name: 'Sepatu Sneakers Casual',
      price: 350000,
      imageUrl: 'assets/sneakers.jpg',
      category: 'Fashion',
      stock: 6,
      description: 'Sneakers nyaman untuk aktivitas sehari-hari.',
      discountPercent: 25,
    ),

    Product(
      id: 12,
      name: 'Teh Hijau Premium',
      price: 55000,
      imageUrl: 'assets/teh.jpg',
      category: 'Makanan',
      stock: 20,
      description: 'Teh hijau dengan aroma yang segar.',
    ),

    Product(
      id: 13,
      name: 'Powerbank 20000mAh',
      price: 275000,
      imageUrl: 'assets/powerbank.jpg',
      category: 'Elektronik',
      stock: 10,
      description: 'Powerbank dengan kapasitas besar.',
    ),

    Product(
      id: 14,
      name: 'Jaket Hoodie Basic',
      price: 185000,
      imageUrl: 'assets/hoodie.jpg',
      category: 'Fashion',
      stock: 7,
      description: 'Hoodie nyaman untuk aktivitas sehari-hari.',
    ),

    Product(
      id: 15,
      name: 'Biskuit Cokelat',
      price: 30000,
      imageUrl: 'assets/biskuit.jpg',
      category: 'Makanan',
      stock: 0,
      description: 'Biskuit dengan rasa cokelat.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TokoKita',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Belanja jadi lebih mudah',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            IconButton(
              tooltip: 'Keranjang',
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Keranjang belum tersedia.'),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body: products.isEmpty
          ? const Center(
        child: Text('Belum ada produk.'),
      )
          : ListView.builder(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ProductCard(
            key: ValueKey(product.id),
            product: product,
          );
        },
      ),
    );
  }
}