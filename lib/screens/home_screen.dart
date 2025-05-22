import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kikuu_clone_new/models/product.dart';
import 'package:kikuu_clone_new/screens/cart_screen.dart';
import 'package:kikuu_clone_new/screens/login_screen.dart';
import 'package:kikuu_clone_new/screens/category_screen.dart';
import 'package:kikuu_clone_new/screens/account_screen.dart';
import 'package:kikuu_clone_new/screens/discount_products_screen.dart';
import 'package:kikuu_clone_new/screens/special_offers_screen.dart'; // Thêm import
import 'package:kikuu_clone_new/services/auth_service.dart';
import 'package:kikuu_clone_new/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  static const List<Map<String, dynamic>> flashSaleProducts = [
    {
      "id": "1",
      "name": "Áo Vest Nam",
      "price": 370000,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-16470779199493TmQtEMTwM.jpg?x-oss-process=style/p_list",
      "discount": 25.0,
    },
    {
      "id": "2",
      "name": "Dép Nữ",
      "price": 120000,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-1693219943105n6YjSJ37GG.jpg?x-oss-process=style/p_list",
      "discount": 0.0,
    },
    {
      "id": "3",
      "name": "Giày Thể Thao Nam",
      "price": 250000,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/upload-productImg-45103808106168598.jpg?x-oss-process=style/p_list",
      "discount": 29.0,
    },
    {
      "id": "4",
      "name": "Tất Nam",
      "price": 12000,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/upload-productImg-1627563070638.jpeg?x-oss-process=style/p_list",
      "discount": 14.0,
    },
    {
      "id": "5",
      "name": "Xe Đạp Cho Trẻ Em",
      "price": 560000,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-1689768016234zEh7MdDAPX.png?x-oss-process=style/p_list",
      "discount": 0.0,
    },
    {
      "id": "6",
      "name": "Giày Nam",
      "price": 210000,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/upload-productImg-42273628486836724.jpg?x-oss-process=style/p_list",
      "discount": 0.0,
    },
    {
      "id": "7",
      "name": "Rèm Che Cửa Kính",
      "price": 450000,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/upload-productImg-4227657274310011.jpg?x-oss-process=style/p_list",
      "discount": 27.0,
    },
    {
      "id": "8",
      "name": "Bộ Váy Nữ",
      "price": 80000,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-1735110051870pWBxFcXy7x.jpg?x-oss-process=style/p_list",
      "discount": 0.0,
    },
    {
      "id": "9",
      "name": "Đồng hồ nữ",
      "price": 430000,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-1713544788079HBmjS6zYWE.jpg?x-oss-process=style/p_list",
      "discount": 0.0,
    },
    {
      "id": "10",
      "name": "Túi xách nữ",
      "price": 350000,
      "imageUrl":
          "https://global2019-static-cdn.kikuu.com/k-s-oss-16485241352152fe3DXyJPn.jpg?x-oss-process=style/p_list",
      "discount": 20.0,
    },
  ];

  List<Map<String, dynamic>> get filteredProducts {
    if (_searchQuery.isEmpty) {
      return flashSaleProducts;
    }
    return flashSaleProducts.where((product) {
      return product["name"].toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  // Lọc danh sách sản phẩm có giảm giá
  List<Map<String, dynamic>> get discountProducts {
    return flashSaleProducts.where((product) {
      return product["discount"] > 0;
    }).toList();
  }

  // Lọc danh sách sản phẩm có giá dưới 200,000 đ cho ưu đãi đặc biệt
  List<Map<String, dynamic>> get specialOfferProducts {
    return flashSaleProducts.where((product) {
      return product["price"] < 200000;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
              imageUrl:
                  "https://global2019-static-cdn.kikuu.com/kikuu/mall/other/static/app-new-icon-2021-01-22.png",
              height: 40,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 8),
            const Text(
              "KIKUU Xin Chào",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Tìm kiếm sản phẩm...",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row chứa hai banner cạnh nhau
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Banner "ƯU ĐÃI ĐẶC BIỆT HÔM NAY" bên trái
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpecialOffersScreen(
                              specialOfferProducts: specialOfferProducts,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 120,
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: CachedNetworkImage(
                                imageUrl: "https://via.placeholder.com/150x120",
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Container(color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "ƯU ĐÃI ĐẶC BIỆT",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "MIỄN PHÍ VẬN CHUYỂN - GIẢM ĐẾN 50%",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Banner "SẢN PHẨM GIẢM GIÁ" bên phải
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiscountProductsScreen(
                              discountProducts: discountProducts,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 120,
                        margin: const EdgeInsets.only(left: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: CachedNetworkImage(
                                imageUrl: "https://via.placeholder.com/150x120",
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Container(color: Colors.orange),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "SẢN PHẨM GIẢM GIÁ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "XEM NGAY CÁC SẢN PHẨM ĐANG GIẢM!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Sản phẩm nổi bật
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Sản phẩm nổi bật",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final productData = filteredProducts[index];
                final product = Product(
                  id: productData["id"],
                  name: productData["name"],
                  price: productData["price"].toDouble(),
                  imageUrl: productData["imageUrl"],
                );
                return ProductCard(
                  product: product,
                  discount: productData["discount"],
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFF05A28),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: "Danh mục"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Giỏ hàng"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Tài khoản"),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoryScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountScreen()),
            );
          }
        },
      ),
    );
  }
}
