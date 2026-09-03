import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flash Sale",
      home: const FlashSalePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FlashSalePage extends StatefulWidget {
  const FlashSalePage({super.key});

  @override
  State<FlashSalePage> createState() => _FlashSalePageState();
}

class _FlashSalePageState extends State<FlashSalePage> {
  int jumlahKeranjang = 3;
  void tambahKeranjang(){
    setState(() {
      jumlahKeranjang++;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Flash Sale"),
        actions: [
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.shopping_cart),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.red,
                  child: Text(
                    "$jumlahKeranjang",

                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // BANNER PROMO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.flash_on,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "FLASH SALE 9.9",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Berakhir dalam 02:15:40",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Daftar Produk",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [

                  // PRODUK 1
                  Expanded(
                    child: ProductCard(
                      nama: "Sepatu Sneaker",
                      hargaAwal: "Rp 650.000",
                      harga: "Rp 325.000",
                      diskon: "50% OFF",
                      gambar:
                          "https://p16-oec-sg.ibyteimg.com/tos-alisg-i-aphluv4xwc-sg/img/VqbcmM/2022/12/19/af6ff50a-8bbd-4420-a097-fae21c46d684.jpg~tplv-aphluv4xwc-resize-jpeg:700:0.jpg",
                      tambahKeranjang: tambahKeranjang,
                    ),
                  ),

                  SizedBox(width: 12),

                  // PRODUK 2
                  Expanded(
                    child: ProductCard(
                      nama: "Jam Tangan Digital",
                      hargaAwal: "Rp 300.000",
                      harga: "Rp 210.000",
                      diskon: "30% OFF",
                      gambar:
                          "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500",
                      tambahKeranjang: tambahKeranjang,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// CLASS PRODUK
class ProductCard extends StatefulWidget {

  final String nama;
  final String hargaAwal;
  final String harga;
  final String diskon;
  final String gambar;
  final VoidCallback tambahKeranjang;

  const ProductCard({
    super.key,
    required this.nama,
    required this.hargaAwal,
    required this.harga,
    required this.diskon,
    required this.gambar,
    required this.tambahKeranjang,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}


class _ProductCardState extends State<ProductCard> {

  bool isFavorite = false;

  void toogleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
          ),
        ],
      ),

      child: Stack(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // GAMBAR PRODUK
              Container(
                height: 130,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),

                  child: Image.network(
                    widget.gambar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // NAMA PRODUK
              Text(
                widget.nama,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              // HARGA AWAL
              Text(
                widget.hargaAwal,
                style: const TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),

              // HARGA FLASH SALE
              Text(
                widget.harga,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),

              const SizedBox(height: 10),

              // BUTTON KERANJANG
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: widget.tambahKeranjang,
                      child: const Text(
                        "+ Keranjang",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // BADGE DISKON
          Positioned(
            top: 5,
            left: 5,

            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 4,
              ),

              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),

              child: Text(
                widget.diskon,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // ICON FAVORIT
          Positioned(
            top: 0,
            right: 0,

            child: IconButton(
              onPressed: toogleFavorite,

              icon: Icon(
                isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,

                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

