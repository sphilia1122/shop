import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kikuu_clone_new/models/product.dart';
import 'package:kikuu_clone_new/screens/cart_screen.dart';
import 'package:kikuu_clone_new/screens/login_screen.dart';
import 'package:kikuu_clone_new/services/auth_service.dart';
import 'package:kikuu_clone_new/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> flashSaleProducts = [
    {
      "id": "1",
      "name": "Industrial angle grinder",
      "price": 9.0,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-16470779199493TmQtEMTwM.jpg?x-oss-process=style/p_list",
      "discount": 25.0,
    },
    {
      "id": "2",
      "name": "Oversized Plaid Two-piece Casual",
      "price": 6.0,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-1693219943105n6YjSJ37GG.jpg?x-oss-process=style/p_list",
      "discount": 0.0,
    },
    {
      "id": "3",
      "name": "3D Braid Heart Pink Phone Case",
      "price": 4.0,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/upload-productImg-45103808106168598.jpg?x-oss-process=style/p_list",
      "discount": 29.0,
    },
    {
      "id": "4",
      "name": "Luxury Brand Waist Bag",
      "price": 6.0,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/upload-productImg-1627563070638.jpeg?x-oss-process=style/p_list",
      "discount": 14.0,
    },
    {
      "id": "5",
      "name": "Plus Size Men 2Pcs/Set",
      "price": 13.0,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-1689768016234zEh7MdDAPX.png?x-oss-process=style/p_list",
      "discount": 0.0,
    },
    {
      "id": "6",
      "name": "2023 New Summer",
      "price": 6.0,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/upload-productImg-42273628486836724.jpg?x-oss-process=style/p_list",
      "discount": 0.0,
    },
    {
      "id": "7",
      "name": "Short Sleeve Set Mens",
      "price": 5.0,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/upload-productImg-4227657274310011.jpg?x-oss-process=style/p_list",
      "discount": 27.0,
    },
    {
      "id": "8",
      "name": "500ML Stainless Steel",
      "price": 5.0,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-1735110051870pWBxFcXy7x.jpg?x-oss-process=style/p_list",
      "discount": 0.0,
    },
    {
      "id": "9",
      "name": "Womens Watch",
      "price": 3.0,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-1713544788079HBmjS6zYWE.jpg?x-oss-process=style/p_list",
      "discount": 0.0,
    },
    {
      "id": "10",
      "name": "Womens Handbag",
      "price": 4.0,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-16485241352152fe3DXyJPn.jpg?x-oss-process=style/p_list",
      "discount": 20.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CachedNetworkImage(
              imageUrl: "https://via.placeholder.com/40",
              height: 40,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 8),
            const Text(
              "KIKUU Xin Chào",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () async {
              await authService.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Tìm kiếm sản phẩm...",
                suffixIcon: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF05A28),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Tìm"),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: "https://via.placeholder.com/300x150",
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Container(color: Colors.red),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "FLASH SALE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "MIỄN PHÍ VẬN CHUYỂN\nGIẢM ĐẾN 50%",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryIcon(Icons.favorite, "Danh sách yêu thích"),
                  _buildCategoryIcon(Icons.new_releases, "Hàng mới"),
                  _buildCategoryIcon(Icons.local_offer, "Khu vực giảm giá"),
                  _buildCategoryIcon(Icons.store, "Bán sỉ"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Flash Sale",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildTimerBox("02"),
                      const SizedBox(width: 4),
                      _buildTimerBox("30"),
                      const SizedBox(width: 4),
                      _buildTimerBox("54"),
                    ],
                  ),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: flashSaleProducts.length,
              itemBuilder: (context, index) {
                final productData = flashSaleProducts[index];
                return ProductCard(
                  product: Product(
                    id: productData["id"],
                    name: productData["name"],
                    price: productData["price"],
                    imageUrl: productData["imageUrl"],
                  ),
                  discount: productData["discount"],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFF05A28),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Danh mục"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Bán sỉ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Giỏ hàng"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Tài khoản"),
        ],
        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: const Color(0xFFF05A28)),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildTimerBox(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        value,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
