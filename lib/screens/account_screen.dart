import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tài khoản")),
      body: const Center(child: Text("Thông tin tài khoản người dùng")),
    );
  }
}
