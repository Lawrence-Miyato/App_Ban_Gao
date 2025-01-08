import 'package:app_ban_gao/screen/shopping/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Paypage extends StatefulWidget {
  final List<Map<String, dynamic>> selectedItems;

  const Paypage({super.key, required this.selectedItems});

  @override
  State<Paypage> createState() => _PaypageState();
}

class _PaypageState extends State<Paypage> {
  // Biến để theo dõi phương thức vận chuyển
  String shippingMethod = "Nhanh"; // Phương thức vận chuyển mặc định

  // Biến để theo dõi phương thức thanh toán (đảm bảo chỉ một phương thức được chọn)
  String paymentMethod = 'CreditCard'; // Lưu phương thức thanh toán đang chọn

  // Biến để theo dõi địa chỉ nhận hàng
  String shippingAddress = "147/19 Tăng Lộc Hai";
  TextEditingController _addressController = TextEditingController();

  // Hàm tính tổng số tiền từ danh sách các sản phẩm đã chọn
  double calculateTotalAmount() {
    double total = 0;
    for (var item in widget.selectedItems) {
      String priceString = item['price']
          .toString()
          .replaceAll('₫', '')
          .replaceAll('.', '')
          .trim();
      double price = double.tryParse(priceString) ?? 0.0;
      int quantity = item['quantity'] is String
          ? int.parse(item['quantity'])
          : item['quantity'];
      total += price * quantity;
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    _addressController.text =
        shippingAddress; // Gán giá trị mặc định cho TextField
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,##0', 'vi_VN');
    double totalAmount = calculateTotalAmount();
    double shippingFee = shippingMethod == "Nhanh"
        ? 20000
        : 5000; // Phí ship khác nhau tùy theo phương thức
    double totalWithShipping = totalAmount + shippingFee;

    String formattedTotalAmount = formatter.format(totalAmount);
    String formattedShippingFee = formatter.format(shippingFee);
    String formattedTotalWithShipping = formatter.format(totalWithShipping);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh Toán'),
      ),
      body: Column(
        children: [
          // Card với TextField cho phép chỉnh sửa địa chỉ
          Card(
            child: ListTile(
              leading: const Icon(Icons.location_on, color: Colors.red),
              title: const Text(
                "Địa chỉ nhận hàng: ",
                style: TextStyle(color: Colors.red),
              ),
              subtitle: TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  hintText: "Nhập địa chỉ nhận hàng",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    shippingAddress =
                        value; // Cập nhật địa chỉ khi người dùng thay đổi
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: [
                // Danh sách sản phẩm đã chọn
                ...widget.selectedItems.map((item) {
                  String priceString = item['price']
                      .toString()
                      .replaceAll('₫', '')
                      .replaceAll('.', '')
                      .trim();
                  double price = double.tryParse(priceString) ?? 0.0;
                  int quantity = item['quantity'] is String
                      ? int.parse(item['quantity'])
                      : item['quantity'];

                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: ListTile(
                      leading: Image.network(
                        item['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        item['name'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Giá: ${formatter.format(price)} x $quantity',
                        style: const TextStyle(color: Colors.green),
                      ),
                      trailing: Text(
                        '${formatter.format(price)} ₫',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }).toList(),
                const SizedBox(height: 20),

                // Nút đổi phương thức vận chuyển
                TextButton(
                  onPressed: () {
                    setState(() {
                      shippingMethod = (shippingMethod == "Nhanh")
                          ? "Thường"
                          : "Nhanh"; // Đổi phương thức vận chuyển
                    });
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Đổi phương thức vận chuyển: ${shippingMethod == "Nhanh" ? "Nhanh" : "Thường"}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Phương thức thanh toán
                const Text(
                  'Chọn phương thức thanh toán:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RadioListTile<String>(
                  title: const Text('Thanh toán khi nhận hàng'),
                  value: 'CashOnDelivery',
                  groupValue: paymentMethod,
                  onChanged: (String? value) {
                    setState(() {
                      paymentMethod = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Thanh toán qua Momo'),
                  value: 'EWallet',
                  groupValue: paymentMethod,
                  onChanged: (String? value) {
                    setState(() {
                      paymentMethod = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Thanh toán qua Thẻ tín dụng'),
                  value: 'CreditCard',
                  groupValue: paymentMethod,
                  onChanged: (String? value) {
                    setState(() {
                      paymentMethod = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // Hiển thị tổng tiền và phí ship
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tổng tiền hàng: $formattedTotalAmount ₫',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Phí vận chuyển: $formattedShippingFee ₫',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tổng thanh toán: $formattedTotalWithShipping ₫',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Nút xác nhận thanh toán
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Xác nhận thanh toán'),
                            content: const Text(
                                'Bạn có chắc chắn muốn thanh toán đơn hàng này?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Đóng hộp thoại
                                },
                                child: const Text('Hủy'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Đóng hộp thoại

                                  // Xóa các sản phẩm đã chọn khỏi giỏ hàng sau khi thanh toán
                                  context
                                      .read<CartModel>()
                                      .removeSelectedItems();

                                  // Chuyển về trang giỏ hàng
                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Thanh toán thành công!'),
                                    ),
                                  );
                                },
                                child: const Text('Xác nhận'),
                              ),
                            ],
                          );
                        },
                      );
                    },
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
                      'Xác nhận thanh toán',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
