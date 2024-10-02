import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Order History',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildOrderCard(
            date: 'August 26, 16:15',
            title: 'BBN! Burger Bang Noel',
            items: ['1x Burger super', '1x mac n cheese'],
            status: 'Food delivered',
            imageUrl:
                'https://www.dapurkobe.co.id/wp-content/uploads/beef-burger-special.jpg',
          ),
          _buildOrderCard(
            date: 'September 12, 6:15',
            title: 'Nasi Ayam Buk Vivi',
            items: ['1x Nasi Ayam', '1x Rendang Ayam'],
            status: 'Canceled',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7wECQITmONvMpPXlTErmLClquJOz5G9zKWQ&s',
          ),
          _buildOrderCard(
            date: 'September 10, 12:15',
            title: 'Promise Miee',
            items: ['1x Mie Ayam special', '1x Es teh maniez'],
            status: 'Food delivered',
            imageUrl:
                'https://awsimages.detik.net.id/community/media/visual/2023/09/17/resep-mie-pedas-tteokbokki-dan-sosis_43.jpeg?w=1200',
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard({
    required String date,
    required String title,
    required List<String> items,
    required String status,
    required String imageUrl,
  }) {
    return Card(
      color: Colors.orange.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imageUrl.startsWith('assets')
                  ? Image.asset(
                      imageUrl,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      imageUrl,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: items
                        .map((item) => Text(
                              item,
                              style: const TextStyle(fontSize: 14),
                            ))
                        .toList(),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 14,
                      color: status == 'Canceled' ? Colors.red : Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ), // Menetapkan warna tetapnya
              onPressed: () {},
              child: const Text('Repeat'),
            )
          ],
        ),
      ),
    );
  }
}
