import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAddress extends StatelessWidget {
  const MyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Address',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.add, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildAddressTile(
            title: 'Home',
            address: 'Jl. Swadaya V No.88',
          ),
          Divider(height: 1, color: Colors.grey[300]),
          _buildAddressTile(
            title: 'Office',
            address: 'Jl. Utama Raya No.4',
          ),
        ],
      ),
    );
  }

  Widget _buildAddressTile({required String title, required String address}) {
    return ListTile(
      leading: const Icon(CupertinoIcons.home),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(address),
      trailing: IconButton(
        icon: const Icon(CupertinoIcons.pencil),
        onPressed: () {},
      ),
    );
  }
}
