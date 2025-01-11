// DetailInfo.dart
class UserInfo {
  String username;
  String email;
  String gender;
  String phoneNumber;
  String birthDate;
  String address;

  UserInfo({
    required this.username,
    required this.email,
    required this.gender,
    required this.phoneNumber,
    required this.birthDate,
    required this.address,
  });
}

UserInfo userInfo = UserInfo(
  username: 'Bán Gạo',
  email: 'bangaongon@gmail.com',
  gender: 'Nam',
  phoneNumber: '0123456789',
  birthDate: '08/06/1999',
  address: '147/19 Đường Tân Lập 2, Hiệp Phú, Hồ Chí Minh',
);
