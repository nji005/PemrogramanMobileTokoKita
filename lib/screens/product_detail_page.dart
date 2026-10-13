import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() {
    return _ProductDetailPageState();
  }
}

class _ProductDetailPageState
    extends State<ProductDetailPage> {
  // Jumlah produk yang akan dibeli
  int jumlah = 1;

  String _rupiah(double nilai) {
    final angka = nilai.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
    );

    return 'Rp$angka';
  }

  @override
  Widget build(BuildContext context) {
    final Product item = widget.product;

    final bool stokHabis = item.stock == 0;

    // Jika produk merupakan DiscountedProduct,
    // gunakan harga setelah diskon.
    final double hargaAkhir =
    item is DiscountedProduct
        ? item.getFinalPrice()
        : item.price;

    // Total harga berdasarkan jumlah yang dipilih.
    final double totalHarga =
        hargaAkhir * jumlah;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        Theme.of(context)
            .colorScheme
            .inversePrimary,

        leading: IconButton(
          tooltip: 'Kembali',
          icon: const Icon(
            Icons.arrow_back,
          ),

          // Kembali ke HomePage
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Detail Produk',
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            // ==========================================
            // GAMBAR PRODUK
            // ==========================================

            Container(
              width: double.infinity,
              height: 200,

              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius:
                BorderRadius.circular(12),
              ),

              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 80,
                color: Colors.blueGrey,
              ),
            ),

            const SizedBox(height: 16),

            // ==========================================
            // NAMA PRODUK
            // ==========================================

            Text(
              item.name,

              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // ==========================================
            // HARGA
            // ==========================================

            // Harga asli dicoret jika ada diskon
            if (item is DiscountedProduct)
              Text(
                _rupiah(item.price),

                style: const TextStyle(
                  decoration:
                  TextDecoration
                      .lineThrough,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

            Text(
              _rupiah(hargaAkhir),

              style: const TextStyle(
                fontSize: 22,
                fontWeight:
                FontWeight.bold,
                color: Colors.green,
              ),
            ),

            // Informasi diskon
            if (item is DiscountedProduct)
              Padding(
                padding:
                const EdgeInsets.only(
                  top: 4,
                ),

                child: Text(
                  'Diskon ${item.discountPercent.toStringAsFixed(0)}%',

                  style:
                  const TextStyle(
                    color: Colors.red,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),

            const SizedBox(height: 12),

            // ==========================================
            // KATEGORI & STATUS STOK
            // ==========================================

            Row(
              children: [
                CategoryTag(
                  category:
                  item.category,
                ),

                const SizedBox(width: 8),

                StockBadge(
                  status:
                  item.getStatusStok(),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              'Stok tersedia: ${item.stock} item',
            ),

            const SizedBox(height: 16),

            // ==========================================
            // DESKRIPSI
            // ==========================================

            Text(
              'Deskripsi',

              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              item.description ??
                  'Tidak ada deskripsi.',
            ),

            const SizedBox(height: 24),

            // ==========================================
            // JUMLAH PRODUK
            // ==========================================

            Text(
              'Jumlah',

              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                // ------------------------------------------
                // Tombol KURANG
                // ------------------------------------------

                Container(
                  decoration:
                  BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius:
                    BorderRadius
                        .circular(8),
                  ),

                  child: IconButton(
                    icon: const Icon(
                      Icons.remove,
                    ),

                    // Minimal jumlah = 1
                    onPressed: jumlah > 1
                        ? () {
                      setState(() {
                        jumlah--;
                      });
                    }
                        : null,
                  ),
                ),

                const SizedBox(width: 16),

                // ------------------------------------------
                // JUMLAH
                // ------------------------------------------

                Container(
                  width: 60,
                  height: 45,

                  alignment:
                  Alignment.center,

                  decoration:
                  BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius:
                    BorderRadius
                        .circular(8),
                  ),

                  child: Text(
                    '$jumlah',

                    style:
                    const TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // ------------------------------------------
                // Tombol TAMBAH
                // ------------------------------------------

                Container(
                  decoration:
                  BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius:
                    BorderRadius
                        .circular(8),
                  ),

                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                    ),

                    // Jumlah tidak boleh melebihi stok
                    onPressed:
                    (!stokHabis &&
                        jumlah <
                            item.stock)
                        ? () {
                      setState(() {
                        jumlah++;
                      });
                    }
                        : null,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ==========================================
            // TOTAL HARGA
            // ==========================================

            Container(
              width: double.infinity,

              padding:
              const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.blue
                    .withValues(
                  alpha: 0.08,
                ),

                borderRadius:
                BorderRadius.circular(
                  12,
                ),
              ),

              child: Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,

                children: [
                  const Text(
                    'Total',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  Text(
                    _rupiah(totalHarga),

                    style:
                    const TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ==========================================
            // TOMBOL TAMBAH KE KERANJANG
            // ==========================================

            SizedBox(
              width: double.infinity,
              height: 50,

              child: FilledButton.icon(
                onPressed: stokHabis
                    ? null
                    : () {
                  // Mengirim jumlah produk
                  // kembali ke HomePage
                  Navigator.pop(
                    context,
                    jumlah,
                  );
                },

                icon: const Icon(
                  Icons.add_shopping_cart,
                ),

                label: Text(
                  stokHabis
                      ? 'Stok Habis'
                      : 'Tambah ke Keranjang',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}