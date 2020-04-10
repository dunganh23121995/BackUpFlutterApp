
enum TYPEPRACTICE{ks_diahinh,ks_congtrinh,tk_quyhoachxaydung,tk_kientruccongtrinh,
                  tk_ketcaucongtrinh,tk_codiencongtrinh,tk_capthoatnuoccongtrinh,tk_xdctgiaothong ,
                  tk_xdctnongnghiepnongthon,tk_xdcthathangkythuat,
                   gs_dandungcongnghiep,gs_giaothong,gs_nongnghiepPTNT,gs_lapdatthietbi,dgxd_dinhgiaxaydung,qldt_quanlyduandautuxd}

enum GROUPBUTTON{khaosatxaydung,thietke,giamsat,dinhgia,quanlydautu}
enum TYPE_PRAC_OR_EXAM{practice,exam}
enum TYPE_EXAMINATION{newnew,notspecialize}
Map<TYPE_EXAMINATION,String> list_type_examination={TYPE_EXAMINATION.newnew:"SÁT HẠCH CẤP MỚI",TYPE_EXAMINATION.notspecialize:"SÁT HẠCH MIỄN CHUYÊN MÔN"};
Map<TYPEPRACTICE,String> list_Specialize = {
  TYPEPRACTICE.ks_diahinh:"Khảo sát địa hình",
  TYPEPRACTICE.ks_congtrinh:"Khảo sát công trình",
  TYPEPRACTICE.tk_quyhoachxaydung:"Thiết kế quy hoạch xây dựng",
  TYPEPRACTICE.tk_kientruccongtrinh:"Thiết kế kiến trúc công trình",
  TYPEPRACTICE.tk_ketcaucongtrinh:"Thiết kế kết cấu công trình dân dụng, công nghiệp",
  TYPEPRACTICE.tk_codiencongtrinh:"Thiết kế, cơ điện công trình",
  TYPEPRACTICE.tk_capthoatnuoccongtrinh:"Thiết kế cấp thoát nước công trình",
  TYPEPRACTICE.tk_xdctgiaothong:"Thiết kế xây dựng công trình giao thông" ,
  TYPEPRACTICE.tk_xdctnongnghiepnongthon:"Thiết kế xây dựng công trình nông nghiệp và phát triển nông thôn",
  TYPEPRACTICE.tk_xdcthathangkythuat:"Thiết kế xây dựng công trình hạ tầng kỹ thuật",
  TYPEPRACTICE.gs_dandungcongnghiep:"Công trình dân dụng công nghiệp và hạ tầng kỹ thuật",
  TYPEPRACTICE.gs_giaothong:"Công trình giao thông",
  TYPEPRACTICE.gs_nongnghiepPTNT:"Công trình nông nghiệp và PTNT",
  TYPEPRACTICE.gs_lapdatthietbi:"Lắp đặt thiết bị vào công trình",
  TYPEPRACTICE.dgxd_dinhgiaxaydung:"Định giá xây dựng",
  TYPEPRACTICE.qldt_quanlyduandautuxd:"Quản lý dự án đầu tư xây dựng",
};