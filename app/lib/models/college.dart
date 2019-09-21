class College{
  final String imagePath;
  final String logoPath;
  final String name;
  final String shortName;
  final String web;
  final int numberOfMajor;
  College(this.imagePath,this.logoPath,this.name,this.shortName,this.numberOfMajor,this.web);
}
List collegeList =[
  College('assets/images/khoa_cntt.jpg','assets/images/cntt_logo.png','Khoa Công nghệ thông tin và truyền thông ','Khoa CNTT & TT',6,'http://www.cit.ctu.edu.vn/index.php/gi-i-thi-u'
  ),
  College('assets/images/khoa_kt.jpg','assets/images/kt_logo.jpg','Khoa Kinh tế','',11,'https://ce.ctu.edu.vn/gioi-thieu/gioi-thieu-khoa.html')
];