import 'package:app_ban_gao/screen/Menu/PopUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:app_ban_gao/screen/shopping/Cart.dart';
import 'package:app_ban_gao/screen/shopping/CartModel.dart'; // Import CartModel

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        actions: [
          Consumer<CartModel>(
            // Dùng Consumer để theo dõi CartModel
            builder: (context, cartModel, child) {
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeContent: Text(
                  cartModel.itemCount.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                showBadge: cartModel.itemCount > 0,
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart_sharp),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Cart()),
                    );
                  },
                ),
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
                // Hiển thị Popup khi người dùng nhấn vào sản phẩm
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Popup(
                      item: item,
                      onAddToCart: (quantity) {
                        context.read<CartModel>().addItem(item, quantity);
                      },
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Gạo lứt hỗn hợp 10 loại hạt Ông Cụ hộp 1kg',
      'price': '49.000₫',
      'image':
          'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/329788/bhx/thiet-ke-chua-co-ten-2024-09-11t143052168_202409111431553581.jpg',
      'description':
          'Gạo lứt hỗn hợp 10 loại hạt Ông Cụ hộp 1kg là loại gạo lứt đặc biệt, được chọn lọc từ giống lúa phù hợp và sản xuất thông qua quá trình thủy nhiệt dưới áp suất cao trước khi sấy khô và tách bỏ lớp vỏ trấu bên ngoài. Đặc biệt, gạo lứt không cần phải ngâm gạo trước khi nấu nhưng vẫn cho hạt cơm mềm và bùi. Đây là sản phẩm chất lượng cung cấp nhiều chất dinh dưỡng cho cơ thể.'
    },
    {
      'name': 'Gạo thơm A An ST25',
      'price': '139.000₫',
      'image':
          'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/332920/bhx/thiet-ke-chua-co-ten-2024-12-17t142205261_202412171422573674.jpg',
      'description':
          'Hạt cơm trắng dài, bóng, dẻo nhiều và có vị ngọt tự nhiên. Cơm vẫn mềm dẻo khi để nguội. Nguồn gốc và xuất xứ: Gạo ST25 được mệnh danh là TOP 1 gạo ngon nhất thế giới 2019'
    },
    {
      'name': 'Gạo thơm Mầm Gạo ST25 Premium',
      'price': '139.000₫',
      'image':
          'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/329073/bhx/thiet-ke-chua-co-ten-2024-10-07t105404016_202410071054131398.jpg',
      'description':
          'Mầm gạo là một thương hiệu mới nổi nhưng nhanh chóng chiếm được lòng tin của người tiêu dùng nhờ chất lượng vượt trội. Gạo thơm ST25 Premium túi 5kg nổi bật với hạt gạo trắng đều, màu sắc đồng nhất và hương thơm tự nhiên khi nấu.'
    },
    {
      'name': 'Gạo tấm thơm Vinh Hiển túi 2kg',
      'price': '47.000₫',
      'image':
          'https://cdn.tgdd.vn/Products/Images/2513/262356/bhx/gao-tam-thom-thanh-yen-vinh-hien-tui-2kg-202112151151462100.jpg',
      'description':
          'Công ty CỔ PHẦN VINH HIỂN FARM xin công bố sản phẩm mới sắp hiện diện trên thị trường: TẤM THƠM THANH YẾN TÚI 2KG.'
    },
    {
      'name': 'Gạo lứt tím Vinh Hiển túi 1kg',
      'price': '48.000₫',
      'image':
          'https://cdn.tgdd.vn/Products/Images/2513/262354/bhx/gao-lut-tim-vinh-hien-tui-1kg-202112151155237174.jpg',
      'description':
          'Công ty CỔ PHẦN VINH HIỂN FARM xin công bố sản phẩm mới sắp hiện diện trên thị trường: Gạo Lứt Tím Vinh Hiển Túi 1kg - Đạt chuẩn HACCP - Ngọt Cơm, Dinh Dưỡng.'
    },
    {
      'name': 'Gạo Meizan Nàng Thơm túi 5kg',
      'price': '120.000₫',
      'image':
          'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/220504/bhx/thiet-ke-chua-co-ten-2024-12-03t094114079_202412030942196840.jpg',
      'description':
          'Gạo Ngon Hảo Hạng Meizan Nàng Thơm được chọn lọc từ giống lúa đặc sản, gieo trồng tập trung trên các cánh đồng phù sa màu mỡ ở vùng Đồng Bằng Sông Cửu Long. – Gạo có hạt thon dài, màu trắng ngà tự nhiên, mặt gạo căng bóng, đều tăm tắp và có hương thơm lôi cuốn. Khi nấu thành cơm, hạt cơm ngon, dẻo, có độ tơi và đặc biệt hơn là khi để nguội vẫn không bị cứng và khó ăn. – Bên cạnh đó, những đặc tính đặc biệt ấy còn được kết hợp cùng quy trình sản xuất với công nghệ hiện đại giúp Gạo Ngon Hảo Hạng Meizan Nàng Thơm luôn đảm bảo vệ sinh an toàn thực phẩm.'
    },
    {
      'name': 'Gạo thơm Vua Gạo Phù Sa',
      'price': '59.000₫',
      'image':
          'https://cdn.tgdd.vn/Products/Images/2513/159560/bhx/gao-thom-vua-gao-phu-sa-tui-2kg-202203281322493097.jpg',
      'description':
          'Gạo phù sa ST21 Vua Gạo túi 5kg với hạt gạo dài, đều màu, được sản xuất bởi quy trình kiểm soát chất lượng nghiêm ngặt. Quy trình sản xuất hiện đại giúp các chất dinh dưỡng như vitamin B1, B2, B3, B5... và khoáng chất canxi, protein, sắt được giữ tối ưu trong hạt gạo. Khi nấu toả hương thơm nhẹ, hạt cơm chín mềm, dẻo, thơm nhẹ và vẫn ngon ngay cả khi để nguội.'
    },
  ];
}
