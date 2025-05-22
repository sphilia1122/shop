import 'package:flutter/material.dart';
import 'package:kikuu_clone_new/models/product.dart';
import 'package:kikuu_clone_new/screens/product_detail_screen.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;

  CategoryProductsScreen({super.key, required this.categoryName});

  // Danh sách sản phẩm mẫu theo danh mục
  final Map<String, List<Map<String, dynamic>>> productsByCategory = {
    "Quần áo": [
      {
        "id": "1", // Bổ sung id
        "name": "Áo vest nam",
        "price": 150000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-16470779199493TmQtEMTwM.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "2", // Bổ sung id
        "name": "Quần jeans nữ",
        "price": 250000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1744443999259NZFH5wsNx4.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "3", // Bổ sung id
        "name": "Áo sơ mi nam",
        "price": 200000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1684914694527KYN6cMpcTz.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "4", // Bổ sung id
        "name": "Váy nữ xòe",
        "price": 300000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1729823900155z3Jn6Brrxy.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "5", // Bổ sung id
        "name": "Áo khoác nam",
        "price": 400000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-1629887679039.jpeg?x-oss-process=style/p_list"
      },
      {
        "id": "6", // Bổ sung id
        "name": "Quần jeans nam",
        "price": 180000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-89429416307162743.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "7", // Bổ sung id
        "name": "Áo khoác nữ",
        "price": 550000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-63696501604434258.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "8", // Bổ sung id
        "name": "Đồ bộ thể thao nam",
        "price": 350000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-27499357381097741.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "9", // Bổ sung id
        "name": "Quần tây nam",
        "price": 270000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-1634276995281.jpeg?x-oss-process=style/p_list"
      },
      {
        "id": "10", // Bổ sung id
        "name": "Áo len nam",
        "price": 320000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-87508149090466335.jpg?x-oss-process=style/p_list"
      },
    ],
    "Giày": [
      {
        "id": "11", // Bổ sung id
        "name": "Giày thể thao nam",
        "price": 300000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-45103808106168598.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "12", // Bổ sung id
        "name": "Giày cao gót nữ",
        "price": 400000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-29710838965573851.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "13", // Bổ sung id
        "name": "Giày thể thao nữ",
        "price": 220000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-1622702504037.jpeg?x-oss-process=style/p_list"
      },
      {
        "id": "14", // Bổ sung id
        "name": "Giày lười nam",
        "price": 350000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-29643520629230151.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "15", // Bổ sung id
        "name": "Giày vải nam",
        "price": 500000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1710400107612PfFEYDAGPT.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "16", // Bổ sung id
        "name": "Dép nam",
        "price": 280000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1726563829362TSQAG2pjpY.png?x-oss-process=style/p_list"
      },
      {
        "id": "17", // Bổ sung id
        "name": "Giày da nam",
        "price": 450000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-71458708945690809.jpeg?x-oss-process=style/p_list"
      },
      {
        "id": "18", // Bổ sung id
        "name": "Dép nữ",
        "price": 260000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-17370077153447PfGF34sW5.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "19", // Bổ sung id
        "name": "Giày thể thao nữ",
        "price": 330000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1679298949949HzQrzJ4WeA.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "20", // Bổ sung id
        "name": "Giày nam",
        "price": 400000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-1635238057620.jpeg?x-oss-process=style/p_list"
      },
    ],
    "Túi xách": [
      {
        "id": "21", // Bổ sung id
        "name": "Túi xách nữ thời trang",
        "price": 350000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-1555842103413.jpeg?x-oss-process=style/p_list"
      },
      {
        "id": "22", // Bổ sung id
        "name": "Balo nam đi học",
        "price": 280000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-1554731863751.jpeg?x-oss-process=style/p_list"
      },
      {
        "id": "23", // Bổ sung id
        "name": "Túi đeo chéo nữ",
        "price": 220000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-16485241352152fe3DXyJPn.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "24", // Bổ sung id
        "name": "Balo du lịch",
        "price": 450000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-46072512382553549.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "25", // Bổ sung id
        "name": "Túi xách nữ",
        "price": 300000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-1604911990283.jpeg?x-oss-process=style/p_list"
      },
      {
        "id": "26", // Bổ sung id
        "name": "Túi đeo vai nữ",
        "price": 180000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1716390115060A7XZhnnCPh.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "27", // Bổ sung id
        "name": "Ví nam",
        "price": 500000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-18662617502199927.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "28", // Bổ sung id
        "name": "Túi xách nữ",
        "price": 260000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-30267582874769652.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "29", // Bổ sung id
        "name": "Túi xách nam",
        "price": 210000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-29060445527628915.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "30", // Bổ sung id
        "name": "Túi du lịch nữ",
        "price": 600000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1658474668731AhpSXpsSfB.jpg?x-oss-process=style/p_list"
      },
    ],
    "Phụ kiện": [
      {
        "id": "31", // Bổ sung id
        "name": "Đồng hồ nữ",
        "price": 120000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1713544788079HBmjS6zYWE.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "32", // Bổ sung id
        "name": "Đồng hồ nam",
        "price": 90000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-77245117381527466.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "33", // Bổ sung id
        "name": "Đồng hồ nữ",
        "price": 80000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-13897595275054834.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "34", // Bổ sung id
        "name": "Đồng hồ nam",
        "price": 70000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1697963749950we4aNaf3mw.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "35", // Bổ sung id
        "name": "Vòng tay nữ",
        "price": 130000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1726105769246SjKKWZzXR6.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "36", // Bổ sung id
        "name": "Bông tai nữ",
        "price": 60000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-1596598826229.jpeg?x-oss-process=style/p_list"
      },
      {
        "id": "37", // Bổ sung id
        "name": "Đồng hồ nữ",
        "price": 110000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-74150899822205090.jpg?x-oss-process=style/p_list"
      },
      {
        "id": "38", // Bổ sung id
        "name": "Dây chuyền",
        "price": 150000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-1633692759264.jpeg?x-oss-process=style/p_list"
      },
      {
        "id": "39", // Bổ sung id
        "name": "Vòng tay nữ",
        "price": 90000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/upload-productImg-1599126869111.jpeg?x-oss-process=style/p_list"
      },
      {
        "id": "40", // Bổ sung id
        "name": "Bộ trang sức nữ",
        "price": 140000,
        "imageUrl":
            "https://global2019-static-cdn.kikuu.com/k-s-oss-1714060627913tPhPeheQ7W.jpg?x-oss-process=style/p_list"
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final products = productsByCategory[categoryName] ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF05A28),
        title: Text("Sản phẩm: $categoryName"),
      ),
      body: products.isEmpty
          ? const Center(child: Text("Không có sản phẩm"))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final productData = products[index];
                final product = Product(
                  id: productData["id"],
                  name: productData["name"],
                  price: productData["price"].toDouble(),
                  imageUrl: productData["imageUrl"],
                );
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.orange.shade200),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.shade50,
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "${product.price.toString()} đ",
                            style: TextStyle(
                              color: Colors.orange.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
