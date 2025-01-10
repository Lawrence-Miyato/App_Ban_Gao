import 'package:app_ban_gao/screen/menu/MenuItem.dart';
import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  String query = ''; // Biến lưu trữ từ khóa tìm kiếm

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> searchResults = menuItems
        .where(
            (item) => item['name'].toLowerCase().contains(query.toLowerCase()))
        .toList(); // Lọc sản phẩm theo tên

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tìm Kiếm'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Tìm kiếm',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  query = value; // Cập nhật từ khóa tìm kiếm
                });
              },
            ),
          ),
          Expanded(
            child: query.isEmpty
                ? const Center(child: Text('Nhập từ khóa để tìm kiếm sản phẩm'))
                : searchResults.isEmpty
                    ? const Center(child: Text('Không tìm thấy sản phẩm nào'))
                    : ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          final product = searchResults[index];
                          return Card(
                            margin: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image.network(product['image']),
                              title: Text(product['name']),
                              subtitle: Text(product['price']),
                              onTap: () {
                                // Hành động khi nhấn vào sản phẩm
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(product['name']),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(product['image']),
                                            const SizedBox(height: 10),
                                            Text('Giá: ${product['price']}'),
                                            const SizedBox(height: 10),
                                            Container(
                                              constraints: const BoxConstraints(
                                                maxHeight:
                                                    200, // Giới hạn chiều cao mô tả
                                              ),
                                              child: SingleChildScrollView(
                                                child: Text(
                                                  product['description'] ??
                                                      'Chưa có mô tả',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black54,
                                                  ),
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Đóng'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
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
