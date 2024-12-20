import 'package:app_ban_gao/screen/shopping/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'popup.dart'; // Import Popup widget để hiển thị thông tin sản phẩm

class Menu extends StatelessWidget {
  const Menu({super.key});

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
        title: const Text('Menu'),
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Điều hướng đến trang giỏ hàng
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cart()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.network(item['image'],
                  width: 50, height: 50, fit: BoxFit.cover),
              title: Text(item['name'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(item['price'],
                  style: const TextStyle(color: Colors.green)),
              onTap: () {
                // Khi người dùng nhấn vào sản phẩm, hiển thị cửa sổ pop-up
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Popup(
                        item: item); // Gọi Popup và truyền thông tin sản phẩm
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
