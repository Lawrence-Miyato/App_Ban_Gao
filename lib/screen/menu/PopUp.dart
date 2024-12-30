import 'package:flutter/material.dart';

class Popup extends StatefulWidget {
  final Map<String, dynamic> item;
  final Function(int) onAddToCart; // Callback để thêm vào giỏ hàng

  const Popup({super.key, required this.item, required this.onAddToCart});

  @override
  _PopupState createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  int quantity = 1; // Khởi tạo số lượng ban đầu

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.item['name'],
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      content: SizedBox(
        height: 400, // Chiều cao của Popup
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hiển thị hình ảnh sản phẩm
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // Bo góc cho ảnh
              child: Image.network(
                widget.item['image'],
                width: 150, // Chiều rộng của ảnh
                height: 150, // Chiều cao của ảnh
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 50,
                  ); // Xử lý lỗi tải ảnh
                },
              ),
            ),
            const SizedBox(height: 20),
            // Hiển thị giá sản phẩm
            Text(
              'Giá: ${widget.item['price']}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            // Hiển thị mô tả sản phẩm
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.item['description'] ?? 'Chưa có mô tả',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.justify, // Căn giữa cho văn bản
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Tùy chọn số lượng
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  widget.onAddToCart(quantity);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Thêm vào giỏ  hàng',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Thực hiện hành động mua ngay
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Mua ngay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
