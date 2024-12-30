import 'package:flutter/material.dart';

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Gạo lứt hỗn hợp 10 loại hạt Ông Cụ hộp 1kg',
      'price': '49.000₫',
      'image':
          'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/329788/bhx/thiet-ke-chua-co-ten-2024-09-11t143052168_202409111431553581.jpg'
    },
    {
      'name': 'Gạo thơm A An ST25',
      'price': '139.000₫',
      'image':
          'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/332920/bhx/thiet-ke-chua-co-ten-2024-12-17t142205261_202412171422573674.jpg'
    },
    {
      'name': 'Gạo thơm Mầm Gạo ST25 Premium',
      'price': '139.000₫',
      'image':
          'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/329073/bhx/thiet-ke-chua-co-ten-2024-10-07t105404016_202410071054131398.jpg'
    },
    {
      'name': 'Gạo tấm thơm Vinh Hiển túi 2kg',
      'price': '47.000₫',
      'image':
          'https://cdn.tgdd.vn/Products/Images/2513/262356/bhx/gao-tam-thom-thanh-yen-vinh-hien-tui-2kg-202112151151462100.jpg'
    },
    {
      'name': 'Gạo lứt tím Vinh Hiển túi 1kg',
      'price': '48.000₫',
      'image':
          'https://cdn.tgdd.vn/Products/Images/2513/262354/bhx/gao-lut-tim-vinh-hien-tui-1kg-202112151155237174.jpg'
    },
    {
      'name': 'Gạo Meizan Nàng Thơm túi 5kg',
      'price': '120.000₫',
      'image':
          'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/220504/bhx/thiet-ke-chua-co-ten-2024-12-03t094114079_202412030942196840.jpg'
    },
    {
      'name': 'Gạo thơm Vua Gạo Phù Sa',
      'price': '59.000₫',
      'image':
          'https://cdn.tgdd.vn/Products/Images/2513/159560/bhx/gao-thom-vua-gao-phu-sa-tui-2kg-202203281322493097.jpg'
    },
  ];

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
