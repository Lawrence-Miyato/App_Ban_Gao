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
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMe21zFpZXkEPs-lVcg6K4PLlanwTbP6e1mA&s',
      'https://megaon.vn/wp-content/uploads/upload1/baner3ff627881c42912a4b07d796cd4efa.jpg',
      'https://house.hunghau.vn/wp-content/uploads/2019/08/3.png',
      'https://file.hstatic.net/200000401369/article/8-12_banner_e4a86e225e974c878fab3d8718713320_grande.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC8mjs0CLgfuHhlNFHhdgwfLcZRgxwjBdpVw&s',
      'https://cdn.tgdd.vn/Files/2021/12/15/1404530/gao-ngon-deo-thom-bua-com-dam-am-giam-den-18-202112151156198207.jpg'
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
