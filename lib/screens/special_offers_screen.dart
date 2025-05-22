import 'package:flutter/material.dart';
import 'package:kikuu_clone_new/models/product.dart';
import 'package:kikuu_clone_new/screens/product_detail_screen.dart';

class SpecialOffersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> specialOfferProducts;

  const SpecialOffersScreen({super.key, required this.specialOfferProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF05A28),
        title: const Text("Ưu đãi đặc biệt"),
      ),
      body: specialOfferProducts.isEmpty
          ? const Center(child: Text("Không có sản phẩm ưu đãi"))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemCount: specialOfferProducts.length,
              itemBuilder: (context, index) {
                final productData = specialOfferProducts[index];
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
                            "${product.price.toStringAsFixed(0)} đ",
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
