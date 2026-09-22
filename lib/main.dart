import 'package:flutter/material.dart';
import 'models/product.dart';
import 'widgets/product_card.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TokoKita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ProductListPage(),
    );
  }
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = [
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
      name: 'Smartwatch Sport Fit',
      price: 499000,
      imageUrl: 'assets/watch.jpg',
      category: 'Elektronik',
      stock: 4,
      description: 'Sensor detak jantung akurat.',
    ),
    Product(
      id: 3,
      name: 'Kaos Polos Katun',
      price: 65000,
      imageUrl: 'assets/kaos.jpg',
      category: 'Fashion',
      stock: 0,
      description: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoKita - Daftar Produk'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            tooltip: 'Hapus 1 Produk (Uji dispose)',
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              if (products.isNotEmpty) {
                setState(() {
                  products.removeLast();
                });
              }
            },
          ),
        ],
      ),
      body: products.isEmpty
          ? const Center(child: Text('Semua produk telah dihapus.'))
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            key: ValueKey(products[index].id),
            product: products[index],
          );
        },
      ),
    );
  }
}