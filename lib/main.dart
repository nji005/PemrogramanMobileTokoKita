import 'package:flutter/material.dart';

import 'models/product.dart' show Product;
import 'screens/main_page.dart';
import 'screens/product_detail_page.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      // Langkah 5: MainPage sebagai halaman awal aplikasi.
      // `home` otomatis menjadi rute '/', jadi '/' tidak ditulis lagi di routes
      // (kalau ditulis bersamaan, Flutter akan melempar assertion error).
      home: const MainPage(),

      // Langkah 2: named routes
      routes: {
        '/detail': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;

          if (args is Product) {
            return ProductDetailPage(product: args);
          }

          return const Scaffold(
            body: Center(child: Text('Produk tidak ditemukan.')),
          );
        },
      },
    );
  }
}