import 'package:app_ban_gao/screen/menu/MenuItem.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Số lượng cột trong lưới
          crossAxisSpacing: 10.0, // Khoảng cách giữa các cột
          mainAxisSpacing: 10.0, // Khoảng cách giữa các hàng
          childAspectRatio: 2 /
              3, // Điều chỉnh tỉ lệ chiều rộng / chiều cao của ô để phù hợp hơn
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // Bo góc ảnh
                    child: Image.network(
                      menuItems[index]['image'],
                      fit: BoxFit.cover, // Hiển thị ảnh theo khung
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.error,
                            color: Colors.red,
                          ), // Xử lý lỗi khi không thể tải ảnh
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    menuItems[index]['name'],
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2, // Hiển thị tối đa 2 dòng
                    overflow:
                        TextOverflow.ellipsis, // Thêm dấu "..." nếu quá dài
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    menuItems[index]['price'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
