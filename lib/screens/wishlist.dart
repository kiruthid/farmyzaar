import 'package:flutter/material.dart';
import 'potato_products_details.dart';
import 'apple_products_deatils.dart';

// ✅ Custom Header
class CustomHeader extends StatelessWidget {
  final String title;
  CustomHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFCBF7B2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 23, right: 10, top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF008054),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(Icons.notifications, color: Colors.black, size: 30),
                  Icon(Icons.notifications, color: Color(0xFFFABB1E), size: 28),
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LikedProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Wheat',
      'description': 'Good quality wheat',
      'user': 'Sahaj Maniya',
      'datetime': '01 Feb•2024  10:00 PM',
      'images': [
        'assets/images/wheat1.jpg',
        'assets/images/wheat2.jpg',
      ],
      'avatar': 'https://i.pravatar.cc/100?img=3'
    },
    {
      'name': 'Potato',
      'description': 'Good quality Potato',
      'user': 'Meet Vadodariya',
      'datetime': '01 Feb•2024  9:00 PM',
      'images': [
        'assets/images/potato1.jpg',
        'assets/images/potato2.jpg',
      ],
      'avatar': 'https://i.pravatar.cc/100?img=5'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          CustomHeader(title: 'Wishlist'),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(product['avatar']),
                        ),
                        title: Text(product['user'], style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(product['datetime'], style: TextStyle(fontSize: 12)),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            textStyle: TextStyle(fontSize: 12),
                          ),
                          child: Text('Add to cart'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 4),
                        child: Text(product['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                        child: Text(product['description']),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: product['images'].map<Widget>((img) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  img,
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFE8FDE8),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.delete, color: Colors.red),
                              label: Text('Remove', style: TextStyle(color: Colors.red)),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.feedback_outlined, color: Colors.black),
                              label: Text('Feedback', style: TextStyle(color: Colors.black)),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.share, color: Colors.black),
                              label: Text('Share', style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
