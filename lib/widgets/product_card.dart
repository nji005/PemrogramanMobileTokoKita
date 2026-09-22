import 'package:flutter/material.dart';
import '../models/product.dart';

class PriceLabel extends StatelessWidget {
  final double price;

  const PriceLabel({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Rp${price.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]}.',
      )}',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }
}

class StockBadge extends StatelessWidget {
  final String status;

  const StockBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color badgeColor;
    if (status == 'Tersedia') {
      badgeColor = Colors.blue;
    } else if (status.startsWith('Stok Terbatas')) {
      badgeColor = Colors.orange;
    } else {
      badgeColor = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: badgeColor, width: 1),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: badgeColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class CategoryTag extends StatelessWidget {
  final String category;

  const CategoryTag({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    Color tagColor;
    switch (category) {
      case 'Elektronik':
        tagColor = Colors.deepPurple;
        break;
      case 'Fashion':
        tagColor = Colors.pink;
        break;
      case 'Makanan':
        tagColor = Colors.teal;
        break;
      default:
        tagColor = Colors.blueGrey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: tagColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        category.toUpperCase(),
        style: TextStyle(
          color: tagColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    print('--> [Lifecycle] initState dipanggil untuk: ${widget.product.name}');
  }

  @override
  Widget build(BuildContext context) {
    print('--> [Lifecycle] build dipanggil untuk: ${widget.product.name}');

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 70,
                height: 70,
                color: Colors.grey.shade200,
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  size: 40,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  PriceLabel(price: widget.product.price),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      CategoryTag(category: widget.product.category),
                      const SizedBox(width: 6),
                      StockBadge(status: widget.product.getStatusStok()),
                    ],
                  ),
                ],
              ),
            ),

            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
                print(
                  'Tombol favorit ditekan pada "${widget.product.name}". Status isFavorite sekarang: $isFavorite',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('--> [Lifecycle] dispose dipanggil untuk: ${widget.product.name}');
    super.dispose();
  }
}