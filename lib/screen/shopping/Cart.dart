import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Import thư viện intl để định dạng số
import 'CartModel.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Xóa các sản phẩm đã chọn
              context.read<CartModel>().removeSelectedItems();
            },
          ),
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) {
          if (cartModel.cartItems.isEmpty) {
            return const Center(
              child: Text('Giỏ hàng của bạn đang trống!'),
            );
          }

          // Tính tổng số tiền của các sản phẩm đã chọn
          double totalAmount = 0;
          for (int i = 0; i < cartModel.cartItems.length; i++) {
            if (cartModel.selectedItems[i]) {
              var item = cartModel.cartItems[i];
              totalAmount += double.parse(item['price']
                      .replaceAll('₫', '')
                      .replaceAll('.', '')
                      .replaceAll(',', '')) *
                  item['quantity'];
            }
          }

          // Sử dụng NumberFormat để định dạng số tiền với dấu phân cách nghìn
          final formatter = NumberFormat(
              '#,##0', 'vi_VN'); // Định dạng số với dấu phân cách nghìn
          String formattedAmount = formatter.format(totalAmount);

          // Thêm đơn vị tiền tệ vào sau số tiền đã định dạng
          String formattedAmountWithCurrency = '$formattedAmount ₫';

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartModel.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartModel.cartItems[index];

                    // Tính giá từng sản phẩm
                    double itemPrice = double.parse(item['price']
                        .replaceAll('₫', '')
                        .replaceAll('.', '')
                        .replaceAll(',', ''));
                    double totalItemPrice = itemPrice * item['quantity'];

                    // Định dạng giá mỗi mặt hàng
                    String formattedItemPrice =
                        formatter.format(totalItemPrice);

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Thêm checkbox vào bên trái của sản phẩm
                            Checkbox(
                              value: cartModel.selectedItems[index],
                              onChanged: (bool? value) {
                                cartModel.toggleSelection(index);
                              },
                            ),
                            Image.network(
                              item['image'],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        title: Text(
                          item['name'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Giá: ${item['price']} x ${item['quantity']}',
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
                ),
              ),
              // Phần thanh toán ở cuối
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Phần tổng cộng bên trái
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tổng cộng: (Sản phẩm đã chọn)',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              formattedAmountWithCurrency, // Hiển thị số tiền đã được định dạng với đơn vị tiền tệ
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Nút thanh toán bên phải
                      ElevatedButton(
                        onPressed: totalAmount > 0
                            ? () {
                                // Logic thanh toán
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:
                                          const Text('Thanh toán thành công!'),
                                      content: const Text(
                                          'Cảm ơn bạn đã mua sắm tại cửa hàng của chúng tôi!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);

                                            // Xóa các sản phẩm đã chọn khỏi giỏ hàng sau khi thanh toán
                                            context
                                                .read<CartModel>()
                                                .removeSelectedItems();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            : null, // Vô hiệu hóa nút nếu không có sản phẩm nào được chọn
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 16.0),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 5.0,
                          shadowColor: Colors.green.withOpacity(0.3),
                        ),
                        child: const Text(
                          'Thanh toán',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
