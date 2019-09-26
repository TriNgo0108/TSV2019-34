class College {
  final String imagePath;
  final String logoPath;
  final String fullName;
  final String shortName;
  final String website;

  College({this.imagePath, this.logoPath, this.fullName, this.shortName, this.website}); // trang web giới thiệu của khoa
  
}

List colleges = [
  College(
    fullName: "Khoa Công nghệ thông tin và Truyền thông",
    shortName: "Khoa CNTT & TT",
    imagePath: "assets/images/khoa_cntt.jpg",
    logoPath: "assets/images/cntt_logo.png",
    website: "http://www.cit.ctu.edu.vn/index.php/gi-i-thi-u"
  ),
  College(
    fullName: "Khoa Kinh tế",
    shortName: "Khoa Kinh tế",
    imagePath: "assets/images/khoa_kt.jpg",
    logoPath: "assets/images/kt_logo.jpg",
    website: "https://ce.ctu.edu.vn/gioi-thieu/gioi-thieu-khoa.html"
  ),
];

// "collegeName": "Bộ môn Giáo dục thể chất",
// "collegeName": "Khoa Công nghệ",
// "collegeName": "Khoa Công nghệ Thông tin & Truyền thông",
// "collegeName": "Khoa Khoa học Chính trị",
// "collegeName": "Khoa Khoa học Tự nhiên",
// "collegeName": "Khoa Khoa học Xã hội và Nhân văn",
// "collegeName": "Khoa Kinh tế",
// "collegeName": "Khoa Luật",
// "collegeName": "Khoa Môi trường & TNTN",
// "collegeName": "Khoa Ngoại ngữ",
// "collegeName": "Khoa Nông nghiệp",
// "collegeName": "Khoa Phát triển Nông thôn",
// "collegeName": "Khoa Sư Phạm",
// "collegeName": "Khoa Thủy sản",
// "collegeName": "Luật",
// "collegeName": "Viện NC&PT Công nghệ Sinh học",
// "collegeName": "Viện Nghiên cứu phát triển ĐBSCL",
