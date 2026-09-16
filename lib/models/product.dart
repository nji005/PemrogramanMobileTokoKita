


//(Langkah 5 & Tugas Mandiri Soal 1)

class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;


  final String? description;


  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  // Tugas Mandiri Soal 1: Method status ketersediaan stok
  String getStatusStok() {
    if (stock > 10) {
      return 'Tersedia';
    } else if (stock > 0) {
      return 'Stok Terbatas';
    } else {
      return 'Habis';
    }
  }


  void printProductInfo() {
    print(
      '[$id] $name - Rp${price.toStringAsFixed(0)} | Status: ${getStatusStok()} (Stok: $stock)',
    );
    print(
      '    Kategori: $category | Deskripsi: ${description ?? "Tidak ada deskripsi"}',
    );
  }
}


// INHERITANCE (Langkah 5)

class DiscountedProduct extends Product {
  final double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  double getFinalPrice() {
    return price - (price * (discountPercent / 100));
  }

  @override
  void printProductInfo() {
    super.printProductInfo();
    print(
      '    Diskon: $discountPercent% -> Harga Final: Rp${getFinalPrice().toStringAsFixed(0)}',
    );
  }
}


// FUNCTIONS (Langkah 4 & Tugas Mandiri Soal 3)


double hitungDiskonBiasa(double harga, double persen) {
  return harga - (harga * (persen / 100));
}

double hitungHargaSetelahDiskon(double harga, {double persenDiskon = 0.0}) {
  return harga - (harga * (persenDiskon / 100));
}


String formatRupiah(double nilai) => 'Rp${nilai.toStringAsFixed(0)}';

double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0.0;
  for (var produk in keranjang) {
    total += produk.price;
  }
  return total;
}

//(Langkah 1 s.d. 5 + Tugas Mandiri)

void main() {
  print('     PRAKTIKUM DASAR DART - TOKOKITA   ');

  // --- LANGKAH 1: Variabel & Tipe Data ---
  print('LANGKAH 1: Variabel & Tipe Data');
  const String namaToko = 'TokoKita';
  final DateTime waktuBuka = DateTime.now();
  var statusToko = 'Buka';
  statusToko = 'Tutup Sementara';

  int stokAwal = 25;
  double hargaBarang = 150000.0;
  String namaProduk = 'Kemeja Flanel Kasual';
  bool isAvailable = true;

  print('Toko: $namaToko | Buka: $waktuBuka | Status: $statusToko');
  print('Nama Produk: $namaProduk');
  print('Harga: Rp$hargaBarang | Stok: $stokAwal | Tersedia: $isAvailable');

  List<String> daftarKategori = ['Elektronik', 'Fashion', 'Makanan'];
  Map<String, dynamic> rawProductData = {
    'id': 1,
    'nama': 'Sepatu Sneakers Pria',
    'harga': 350000.0,
    'kategori': 'Fashion',
    'stok': 12,
    'tersedia': true,
  };
  print('Kategori Tersedia: $daftarKategori');
  print('Raw Map Data: $rawProductData\n');

  // --- LANGKAH 2: Operator ---
  print('LANGKAH 2: Operator');
  int jumlahBeli = 3;
  double totalHargaBeli = hargaBarang * jumlahBeli;
  int sisaStok = stokAwal - jumlahBeli;
  double pajak = totalHargaBeli * 0.11;
  double totalBayar = totalHargaBeli + pajak;

  print('Pembelian: $jumlahBeli item x Rp$hargaBarang = Rp$totalHargaBeli');
  print('Total Bayar (+ Pajak 11%): Rp$totalBayar');
  print('Sisa Stok: $sisaStok');
  print('Apakah harga > 100rb? ${hargaBarang > 100000}');
  print('Apakah stok awal == 25? ${stokAwal == 25}');
  print(
    'Produk layak tampil (stok > 0 && harga > 0): ${(sisaStok > 0) && (hargaBarang > 0)}\n',
  );

  // --- LANGKAH 3: Control Flow ---
  print('LANGKAH 3: Control Flow');
  String tentukanStatusStok(int s) {
    if (s > 10) return 'Tersedia';
    if (s > 0) return 'Stok Terbatas';
    return 'Habis';
  }

  print('Status Stok ($sisaStok item): ${tentukanStatusStok(sisaStok)}');

  List<double> listHargaKeranjang = [150000.0, 75000.0, 250000.0, 50000.0];
  double totalBelanjaan = 0;
  for (int i = 0; i < listHargaKeranjang.length; i++) {
    totalBelanjaan += listHargaKeranjang[i];
  }
  print('Total simulasi keranjang (for loop): Rp$totalBelanjaan');

  int stokSimulasi = 3;
  print('Memulai simulasi pengurangan stok:');
  while (stokSimulasi > 0) {
    print('  Barang dibeli 1 pcs. Sisa stok: $stokSimulasi');
    stokSimulasi--;
  }
  print('  Stok habis!');

  String kategoriPilihan = 'Fashion';
  double diskonKategori = 0;
  switch (kategoriPilihan) {
    case 'Elektronik':
      diskonKategori = 0.10;
      break;
    case 'Fashion':
      diskonKategori = 0.15;
      break;
    case 'Makanan':
      diskonKategori = 0.05;
      break;
    default:
      diskonKategori = 0.0;
  }
  print(
    'Diskon kategori $kategoriPilihan: ${(diskonKategori * 100).toInt()}%\n',
  );

  // --- LANGKAH 4: Functions ---
  print('LANGKAH 4: Functions');
  print(
    'Positional function (100rb, diskon 20%): ${formatRupiah(hitungDiskonBiasa(100000, 20))}',
  );
  print('Tanpa diskon: ${formatRupiah(hitungHargaSetelahDiskon(200000))}');
  print(
    'Dengan diskon 10%: ${formatRupiah(hitungHargaSetelahDiskon(200000, persenDiskon: 10))}\n',
  );

  // --- LANGKAH 5: OOP & Null Safety ---
  print('LANGKAH 5: OOP & Null Safety');
  Product p1 = Product(
    id: 1,
    name: 'Wireless Bluetooth Headset',
    price: 320000,
    imageUrl: 'assets/headset.jpg',
    category: 'Elektronik',
    stock: 15,
    description: 'Headset dengan fitur noise cancellation jernih.',
  );

  Product p2 = Product(
    id: 2,
    name: 'Kaos Polos Hitam',
    price: 85000,
    imageUrl: 'assets/kaospolos.jpg',
    category: 'Fashion',
    stock: 0,
    description: null,
  );

  DiscountedProduct p3 = DiscountedProduct(
    id: 3,
    name: 'Smartwatch',
    price: 500000,
    imageUrl: 'assets/smartwatch.jpg',
    category: 'Elektronik',
    stock: 8,
    description: 'Layar AMOLED dan sensor detak jantung.',
    discountPercent: 20,
  );

  p1.printProductInfo();
  p2.printProductInfo();
  p3.printProductInfo();


  print('             HASIL TUGAS MANDIRI                  ');


  // TUGAS MANDIRI 1: Method getStatusStok()
  print('\n[TUGAS MANDIRI 1] Pengujian Method getStatusStok():');
  Product ujiStokBanyak = Product(
    id: 98,
    name: 'Barang Stok Melimpah',
    price: 50000,
    imageUrl: 'assets/test1.jpg',
    category: 'Lainnya',
    stock: 20,
  );
  Product ujiStokSedikit = Product(
    id: 99,
    name: 'Barang Stok Menipis',
    price: 50000,
    imageUrl: 'assets/test2.jpg',
    category: 'Lainnya',
    stock: 3,
  );
  Product ujiStokKosong = Product(
    id: 100,
    name: 'Barang Habis Total',
    price: 50000,
    imageUrl: 'assets/test3.jpg',
    category: 'Lainnya',
    stock: 0,
  );

  print(
    ' - ${ujiStokBanyak.name} (Stok: ${ujiStokBanyak.stock}) -> Status: ${ujiStokBanyak.getStatusStok()}',
  );
  print(
    ' - ${ujiStokSedikit.name} (Stok: ${ujiStokSedikit.stock}) -> Status: ${ujiStokSedikit.getStatusStok()}',
  );
  print(
    ' - ${ujiStokKosong.name} (Stok: ${ujiStokKosong.stock}) -> Status: ${ujiStokKosong.getStatusStok()}',
  );

  // TUGAS MANDIRI 2: List 8 Produk Dummy
  print('\n[TUGAS MANDIRI 2] List 8 Data Dummy Produk TokoKita:');
  List<Product> dummyProducts = [
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
      description: 'Baterai tahan 24 jam.',
    ),
    Product(
      id: 3,
      name: 'Smartwatch Sport Fit',
      price: 499000,
      imageUrl: 'assets/watch.jpg',
      category: 'Elektronik',
      stock: 4,
      description: 'Anti-air dan sensor detak jantung.',
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
    Product(
      id: 8,
      name: 'Tas Ransel Laptop',
      price: 275000,
      imageUrl: 'assets/tas.jpg',
      category: 'Fashion',
      stock: 9,
      description: 'Bahan tahan air muat 15 inci.',
    ),
  ];

  for (var item in dummyProducts) {
    item.printProductInfo();
  }

  // --- TUGAS MANDIRI 3: Function hitungTotalBelanja() ---
  print('\n[TUGAS MANDIRI 3] Simulasi Function hitungTotalBelanja():');
  List<Product> keranjang = [
    dummyProducts[0],
    dummyProducts[2],
    dummyProducts[7], 
  ];

  print('Daftar Produk di Keranjang (${keranjang.length} item):');
  for (var k in keranjang) {
    print(' • ${k.name} : ${formatRupiah(k.price)}');
  }

  double grandTotal = hitungTotalBelanja(keranjang);
  print('Total Keseluruhan Belanja: ${formatRupiah(grandTotal)}');
}
