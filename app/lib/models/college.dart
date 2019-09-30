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
    fullName: "Khoa Công nghệ thông tin và Truyền thông",         //
    shortName: "Khoa CNTT & TT",
    imagePath: "assets/images/khoa_cntt.jpg",
    logoPath: "assets/images/cntt_logo.png",
    website: "http://www.cit.ctu.edu.vn/index.php/gi-i-thi-u"
  ),
  College(
    fullName: "Khoa Kinh tế",                                               //
    shortName: "Khoa Kinh tế",
    imagePath: "assets/images/khoa_kt.jpg",
    logoPath: "assets/images/kt_logo.jpg",
    website: "https://ce.ctu.edu.vn/gioi-thieu/gioi-thieu-khoa.html"
  ),
  College(  
    fullName: "Bộ môn Giáo dục thể chất",                           //
    shortName: "Bộ môn GDTC",
    imagePath: "assets/images/khoa_gdtc.jpg",
    logoPath: "assets/images/gdtc_logo.jpg",
    website: "https://dpe.ctu.edu.vn/index.php/gioi-thieu/gioi-thieu-bo-mon"
  ),
  College(
    fullName: "Khoa Công nghệ",                       //
    shortName: "Khoa Công nghệ",
    imagePath: "assets/images/khoa_cn.jpg",
    logoPath: "assets/images/cn_logo.jpg",
    website: "https://cet.ctu.edu.vn/gioi-thieu/gioi-thieu-khoa.html"
  ),
  College(
    fullName: "Khoa Khoa học Chính trị",                          //
    shortName: "Khoa KHCT",
    imagePath: "assets/images/khoa_khct.jpg",
    logoPath: "assets/images/khct_logo.jpg",
    website: "https://sps.ctu.edu.vn/gioi-thieu/gioi-thieu-khoa"
  ),
  College(
    fullName: "Khoa Khoa học Tự nhiên",                               //
    shortName: "Khoa KHTN",
    imagePath: "assets/images/khoa_khtn.jpg",
    logoPath: "assets/images/khtn_logo.jpg",
    website: "https://cns.ctu.edu.vn/gioi-thieu/gioi-thieu.html"
  ),
  College(
    fullName: "Khoa Khoa học Xã hội và Nhân văn",                     //
    shortName: "Khoa KHXH&NV",
    imagePath: "assets/images/khoa_khxh.jpg",
    logoPath: "assets/images/khxh_logo.jpg",
    website: "https://sss.ctu.edu.vn/gioi-thieu/gioi-thieu-khoa.html"
  ),
  College(
    fullName: "Khoa Luật",                                        //
    shortName: "Khoa Luật",
    imagePath: "assets/images/khoa_l.jpg",
    logoPath: "assets/images/l_logo.jpg",
    website: "https://sl.ctu.edu.vn/gioi-thieu.html"
  ),
  College(
    fullName: "Khoa Môi trường & TNTN",                               //
    shortName: "Khoa MT&TNTN",
    imagePath: "assets/images/khoa_mt.jpg",
    logoPath: "assets/images/mt_logo.jpg",
    website: "https://cenres.ctu.edu.vn/gi/gi.html"
  ),
  College(
    fullName: "Khoa Ngoại ngữ",                                       //
    shortName: "Khoa Ngoại ngữ",
    imagePath: "assets/images/khoa_ngng.jpg",
    logoPath: "assets/images/ngng_logo.jpg",
    website: "https://sfl.ctu.edu.vn/gioi-thieu/lich-su-hinh-thanh.html"
  ),
  College(
    fullName: "Khoa Nông nghiệp",                             //
    shortName: "Khoa Nông nghiệp",
    imagePath: "assets/images/khoa_nn.jpg",
    logoPath: "assets/images/nn_logo.jpg",
    website: "https://coa.ctu.edu.vn/gioi-thieu.html"
  ),
  College(
    fullName: "Khoa Phát triển Nông thôn",                    //
    shortName: "Khoa PTNT",
    imagePath: "assets/images/khoa_ptnt.jpg",
    logoPath: "assets/images/ptnt_logo.jpg",
    website: "https://crd.ctu.edu.vn/gioi-thieu.html"
  ),
  College(
    fullName: "Khoa Sư Phạm",            //
    shortName: "Khoa Sư Phạm",
    imagePath: "assets/images/khoa_sp.jpg",
    logoPath: "assets/images/sp_logo.jpg",
    website: "https://se.ctu.edu.vn/gt.html"
  ),
  College(
    fullName: "Khoa Thủy sản",         //
    shortName: "Khoa Thủy sản",
    imagePath: "assets/images/khoa_ts.jpg",
    logoPath: "assets/images/ts_logo.jpg",
    website: "https://caf.ctu.edu.vn/gioi-thieu/gioi-thieu-khoa.html"
  ),
  College(
    fullName: "Viện NC&PT Công nghệ Sinh học",                      //
    shortName: "Viện NC&PTCNSH",
    imagePath: "assets/images/khoa_cnsh.jpg",
    logoPath: "assets/images/cnsh_logo.jpg",
    website: "https://birdi.ctu.edu.vn/gioi-thieu/lich-su"
  ),
  College(
    fullName: "Viện Nghiên cứu phát triển ĐBSCL",                         //
    shortName: "Viện NCPTDBSCL",
    imagePath: "assets/images/khoa_dbscl.jpg",
    logoPath: "assets/images/dbscl_logo.jpg",
    website: "https://mdi.ctu.edu.vn/gioi-thieu/gioi-thieu-chung"
  ),
];

// "collegeName": "Bộ môn Giáo dục thể chất",   gdtc
// "collegeName": "Khoa Công nghệ",    cn
// "collegeName": "Khoa Công nghệ Thông tin & Truyền thông",  cntt
// "collegeName": "Khoa Khoa học Chính trị",  ct
// "collegeName": "Khoa Khoa học Tự nhiên", khtn
// "collegeName": "Khoa Khoa học Xã hội và Nhân văn",  khxh
// "collegeName": "Khoa Kinh tế",    kt
// "collegeName": "Khoa Luật",     l
// "collegeName": "Khoa Môi trường & TNTN",   mt
// "collegeName": "Khoa Ngoại ngữ",     ngng
// "collegeName": "Khoa Nông nghiệp",      nn
// "collegeName": "Khoa Phát triển Nông thôn",    ptnt
// "collegeName": "Khoa Sư Phạm",    sp
// "collegeName": "Khoa Thủy sản",        ts
// "collegeName": "Viện NC&PT Công nghệ Sinh học",     cnsh
// "collegeName": "Viện Nghiên cứu phát triển ĐBSCL",       dbscl
