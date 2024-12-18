import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Nhà phân phối gạo sỉ & lẻ an bình phát',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Times New Roman',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Chúng tôi cung cấp gạo đặc sản được thu mua từ các vùng chuyên canh, sản xuất lúa gạo lớn trên cả nước , đảm bảo: gạo không đấu trộn, không chất bảo quản, không hoá chất tẩy trắng, tạo mùi',
                        maxLines: 12,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Kho gạo An Bình Phát cung cấp đa dạng chủng loại gạo với nhiều đặc tính như nở xốp mềm cơm, dẻo thơm, tấm, nếp…các loại gạo sạch đóng túi như Gạo Ông Cua, gạo A An, Gạo Cỏ May…đáp ứng đầy đủ thị hiếu của người tiêu dùng.',
                        maxLines: 12,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Đội ngũ nhân viên bán hàng giàu kinh nghiệm, am hiểu sản phẩm, tư vấn phù hợp với ngân sách, sở thích và nhu cầu của khách hàng',
                        maxLines: 12,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
