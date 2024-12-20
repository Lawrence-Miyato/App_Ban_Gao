import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carouselpromotion extends StatefulWidget {
  const Carouselpromotion({super.key});

  @override
  State<Carouselpromotion> createState() => _CarouselpromotionState();
}

class _CarouselpromotionState extends State<Carouselpromotion> {
  @override
  Widget build(BuildContext context) {
    //Luu danh sach hinh anh
    List<String> listproduct = [
      'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/329788/bhx/thiet-ke-chua-co-ten-2024-09-11t143052168_202409111431553581.jpg',
      'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/332920/bhx/thiet-ke-chua-co-ten-2024-12-17t142205261_202412171422573674.jpg',
      'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/329073/bhx/thiet-ke-chua-co-ten-2024-10-07t105404016_202410071054131398.jpg',
      'https://cdn.tgdd.vn/Products/Images/2513/262356/bhx/sellingpoint.jpg',
      'https://cdn.tgdd.vn/Products/Images/2513/262354/bhx/sellingpoint.jpg',
      'https://cdnv2.tgdd.vn/bhx-static/bhx/Products/Images/2513/220504/bhx/thiet-ke-chua-co-ten-2024-12-03t094114079_202412030942196840.jpg'
    ];
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true, // Hình ảnh tự động chuyển tiếp
          enlargeCenterPage: true, // Phóng to hình ảnh ở giữa
          aspectRatio: 2.0, // Tỷ lệ khung hình
          viewportFraction: 1.0, // Độ rộng của mỗi hình ảnh
        ),
        items: listproduct
            .map((item) => Container(
                  // Hiển thị hình ảnh từ URL
                  // ignore: sort_child_properties_last
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // Bo góc hình ảnh
                    child: Image.network(
                      item,
                      fit: BoxFit.cover, // Căn chỉnh hình ảnh trong khung
                      width: 1000.0,
                      errorBuilder: (context, error, stackTrace) {
                        // Xử lý nếu hình ảnh không load được
                        return const Center(
                          child: Text(
                            'Không thể tải hình ảnh',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      },
                    ),
                  ),
                  margin: const EdgeInsets.all(5.0),
                ))
            .toList(),
      ),
    );
  }
}
