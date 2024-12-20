import 'package:app_ban_gao/screen/shopping/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'name': 'Gạo lứt hỗn hợp 10 loại hạt Ông Cụ hộp 1kg',
        'price': '\49.000₫',
        'image':
            'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/329788/bhx/thiet-ke-chua-co-ten-2024-09-11t143052168_202409111431553581.jpg'
      },
      {
        'name': 'Gạo thơm A An ST25',
        'price': '\139.000₫',
        'image':
            'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/332920/bhx/thiet-ke-chua-co-ten-2024-12-17t142205261_202412171422573674.jpg'
      },
      {
        'name': 'Gạo thơm Mầm Gạo ST25 Premium',
        'price': '\139.000₫',
        'image':
            'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/329073/bhx/thiet-ke-chua-co-ten-2024-10-07t105404016_202410071054131398.jpg'
      },
      {
        'name': 'Gạo tấm thơm Vinh Hiển túi 2kg',
        'price': '\47.000₫',
        'image':
            'https://cdn.tgdd.vn/Products/Images/2513/262356/bhx/gao-tam-thom-thanh-yen-vinh-hien-tui-2kg-202112151151462100.jpg'
      },
      {
        'name': 'Gạo lứt tím Vinh Hiển túi 1kg',
        'price': '\48.000₫',
        'image':
            'https://cdn.tgdd.vn/Products/Images/2513/262354/bhx/gao-lut-tim-vinh-hien-tui-1kg-202112151155237174.jpg'
      },
      {
        'name': 'Gạo Meizan Nàng Thơm túi 5kg',
        'price': '\120.000₫',
        'image':
            'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/220504/bhx/thiet-ke-chua-co-ten-2024-12-03t094114079_202412030942196840.jpg'
      },
      {
        'name': 'Gạo thơm Vua Gạo Phù Sa',
        'price': '\59.000₫',
        'image':
            'https://cdn.tgdd.vn/Products/Images/2513/159560/bhx/gao-thom-vua-gao-phu-sa-tui-2kg-202203281322493097.jpg'
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ Hàng'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) {
          if (cartModel.cartItems.isEmpty) {
            return const Center(
              child: Text('Giỏ hàng của bạn đang trống!'),
            );
          }

          return ListView.builder(
            itemCount: cartModel.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartModel.cartItems[index];

              // Kiểm tra và thay thế nếu giá trị là null
              String name = item['name'] ?? 'Tên sản phẩm không có';
              String price = item['price'] ?? '0₫';
              String image = item['image'] ??
                  ''; // Nếu không có ảnh, có thể dùng ảnh mặc định
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: image != null && image.isNotEmpty
                      ? Image.network(
                          image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child; // Hình ảnh đã tải xong
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                ),
                              );
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                                Icons.error); // Nếu ảnh không tải được
                          },
                        )
                      : const Icon(Icons
                          .image_not_supported), // Nếu không có ảnh, hiển thị icon lỗi
                  title: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Giá: $price x ${item['quantity']}',
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          cartModel.decreaseQuantity(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          cartModel.increaseQuantity(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
