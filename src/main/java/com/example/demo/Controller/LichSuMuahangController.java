package com.example.demo.Controller;

import com.example.demo.Entity.HoaDon;
import com.example.demo.Entity.HoaDonChiTiet;
import com.example.demo.Repo.HoaDonCtRepo;
import com.example.demo.Repo.HoaDonRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/lich-su-mua-hang")
public class LichSuMuahangController {
    @Autowired
    private HoaDonRepo hdRepo;
    @Autowired
    private HoaDonCtRepo hdctRepo;
    @GetMapping("/hien-thi")
    public String history(Model model,
                          @RequestParam("page")Optional<Integer>page) {
        Pageable pageable = PageRequest.of(page.orElse(0),3 );
        Page<HoaDon>  pageHoaDon = hdRepo.findHoaDonByTrangThai(0,pageable);
        model.addAttribute("currentPage",page.orElse(0));
        model.addAttribute("totalPage",pageHoaDon.getTotalPages());
        model.addAttribute("listHoaDon",pageHoaDon);
        return "History";
    }
    @GetMapping("chi-tiet-don-hang/{id}")
    public String chiTiet(RedirectAttributes redirectAttributes, @PathVariable("id")Long id){
        double tong = 0;
        for(HoaDonChiTiet x:hdctRepo.findByHoaDon_Id(id)){
            tong+=(x.getDonGia()*x.getSoLuong());
        }
        redirectAttributes.addFlashAttribute("tongTien",tong);
        redirectAttributes.addFlashAttribute("listHoaDonCt",hdctRepo.findByHoaDon_Id(id));
        return "redirect:/lich-su-mua-hang/hien-thi";
    }

}
