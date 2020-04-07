
import 'package:testappflutter/Practice/group_field.dart';

List<String> listStringDialog_PRAC=["SÁT HẠCH CẤP MỚI","Ôn tập: \n \t~Pháp luật chung.\n \t~Pháp luật riêng.\n \t~Chuyên môn",
                                    "SÁT HẠCH MIỄN CHUYÊN MÔN","Ôn tập: \n \t~Pháp luật chung.\n \t~Pháp luật riêng."];
List<String> listStringDialog_EXAM=["SÁT HẠCH CẤP MỚI","Đề thi gồm: 25câu / 30phút \n\t ~3 câu pháp luật chung.\n\t ~2 câu pháp luật riêng.\n\t ~20 câu pháp luật chuyên môn",
                                    "SÁT HẠCH CHUYÊN MÔN","Đề thi gồm: 10câu / 12phút\n\t ~5 câu pháp luật chung.\n\t ~5 câu pháp luật riêng."];
class InforNavOfPratice{
  InforNavOfPratice({this.namebutton,this.typepractice});

  String namebutton;
  TYPEPRACTICE typepractice;

  static List<InforNavOfPratice> list_infor_I =[
    InforNavOfPratice(namebutton: "Khảo sát địa hình",typepractice:TYPEPRACTICE.ks_diahinh ),
    InforNavOfPratice(namebutton: "Khảo sát công trình",typepractice: TYPEPRACTICE.ks_congtrinh),
  ];
  static List<InforNavOfPratice> list_infor_II=[
    InforNavOfPratice(namebutton: "Thiết kế quy hoạch xây dựng",typepractice:TYPEPRACTICE.tk_quyhoachxaydung ),
    InforNavOfPratice(namebutton: "Thiết kế kiến trúc công trình",typepractice:TYPEPRACTICE.tk_kientruccongtrinh ),
    InforNavOfPratice(namebutton: "Thiết kế kết cấu công trình dân dụng, công nghiệp",typepractice:TYPEPRACTICE.tk_ketcaucongtrinh),
    InforNavOfPratice(namebutton: "Thiết kế, cơ điện công trình",typepractice:TYPEPRACTICE.tk_codiencongtrinh),
    InforNavOfPratice(namebutton: "Thiết kế cấp thoát nước công trình",typepractice:TYPEPRACTICE.tk_capthoatnuoccongtrinh),
    InforNavOfPratice(namebutton: "Thiết kế xây dựng công trình giao thông",typepractice:TYPEPRACTICE.tk_xdctgiaothong),
    InforNavOfPratice(namebutton: "Thiết kế xây dựng công trình nông nghiệp và phát triển nông thôn",typepractice:TYPEPRACTICE.tk_xdctnongnghiepnongthon),
    InforNavOfPratice(namebutton: "Thiết kế xây dựng công trình hạ tầng kỹ thuật",typepractice:TYPEPRACTICE.tk_xdcthathangkythuat),
  ];
  static List<InforNavOfPratice> list_infor_III=[
    InforNavOfPratice(namebutton: "Công trình dân dụng công nghiệp và hạ tầng kỹ thuật",typepractice:TYPEPRACTICE.gs_dandungcongnghiep),
    InforNavOfPratice(namebutton: "Công trình giao thông",typepractice:TYPEPRACTICE.gs_giaothong),
    InforNavOfPratice(namebutton: "Công trình nông nghiệp và PTNT",typepractice:TYPEPRACTICE.gs_nongnghiepPTNT),
    InforNavOfPratice(namebutton: "Lắp đặt thiết bị vào công trình",typepractice:TYPEPRACTICE.gs_lapdatthietbi),
  ];
  static List<InforNavOfPratice> list_infor_IV=[
    InforNavOfPratice(namebutton: "Định giá xây dựng",typepractice:TYPEPRACTICE.dgxd_dinhgiaxaydung),
  ];
  static List<InforNavOfPratice> list_infor_V=[
    InforNavOfPratice(namebutton: "Quản lý dự án đầu tư xây dựng",typepractice:TYPEPRACTICE.qldt_quanlyduandautuxd),
  ];

}