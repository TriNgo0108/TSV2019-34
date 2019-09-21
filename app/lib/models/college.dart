class College {
  final String imagePath;// hình nền
  final String logoPath; // logo của khoa
  final String name; // tên khoa
  final String shortName; // tên viết tắt của khoa
  final String web; // trang web giới thiệu của khoa
  final int numberOfMajor; // số ngành khoa đào tạo

  College(this.imagePath, this.logoPath, this.name, this.shortName,
      this.numberOfMajor, this.web);
}

List collegeList = [
  College(
      'assets/images/khoa_cntt.jpg',
      'assets/images/cntt_logo.png',
      'Khoa Công nghệ thông tin và truyền thông ',
      'Khoa CNTT & TT',
      6,
      'http://www.cit.ctu.edu.vn/index.php/gi-i-thi-u'),
  College(
      'assets/images/khoa_kt.jpg',
      'assets/images/kt_logo.jpg',
      'Khoa Kinh tế',
      '',
      11,
      'https://ce.ctu.edu.vn/gioi-thieu/gioi-thieu-khoa.html')
];
