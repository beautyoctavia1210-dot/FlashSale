import 'package:flutter/material.dart';

void main() {
  runApp(const MyCookpad());
}

class MyCookpad extends StatelessWidget {
  const MyCookpad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ================= HEADER =================
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Cookpad_logo.svg/960px-Cookpad_logo.svg.png',
                        width: 150,
                      ),
                      const Spacer(),
                      // foto profil bulat
                      const Icon(
                        Icons.account_circle,
                        size: 35,
                      ),
                       const Icon(
                        Icons.notifications_none,
                        size: 30,
                      ),
                    ],
                  ),
                ),

                // ================= SEARCH BAR =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ketik bahan-bahan...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // ================= BANNER PROMO =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      // ganti dengan AssetImage('assets/banner.png') kalau
                      // sudah punya gambar banner sendiri di folder assets
                      'assets/banner.png',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // ================= JUDUL SECTION =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Pencarian Populer',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Diperbarui 04.30',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // ================= GRID RESEP =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 1.3,
                    children: const [
                      _RecipeCard(
                        title: 'ayam bakar',
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_q--2_5h7QASgiqoL7q3M_0LSvlqGiJjPNaktR0VPoA&s=10',
                      ),
                      _RecipeCard(
                        title: 'bolu pisang kukus takaran sendok',
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNFzfhUHdT1fI81qc3mfCIH28Su0S7kiN3VnJSwnMWgg&s=10',
                      ),
                      _RecipeCard(
                        title: 'capcay',
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0YljmV8z__r_NRObUf8P6UDJcIvK9w5DXajeTl2IWfA&s',
                      ),
                      _RecipeCard(
                        title: 'bolu pisang',
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXbFLHWVAnFsi-aBkMt2ESNvVULFIUi64BUp9LPCVieA&s=10',
                      ),
                      _RecipeCard(
                        title: 'soto ayam',
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_RVe4rHImgjwUiiIQaDmSyd6KVAiB8vTGaeKQ8NRC3g&s=10',
                      ),
                      _RecipeCard(
                        title: 'brownies kukus',
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy1Aec2QIoB2VzQpXmWbs1ptHOVpYR-HAXSkMd-LNEaw&s=10',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget kartu resep: gambar + teks overlay di bagian bawah
class _RecipeCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const _RecipeCard({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // gambar
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),

          // gradasi gelap di bawah supaya teks terbaca
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.65),
                ],
                stops: const [0.5, 1.0],
              ),
            ),
          ),

          // teks judul resep
          Positioned(
            left: 10,
            bottom: 10,
            right: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}