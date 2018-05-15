package com.jhta.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jhta.project.service.ItemFilterServiceImpl;
import com.jhta.project.service.ShopAdminServiceImpl;
import com.jhta.project.service.ShopService;
import com.jhta.project.vo.ItemFilterVo;
import com.jhta.project.vo.ShopClassJoinShopFieldVo;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopFilterContentVo;
import com.jhta.project.vo.ShopFilterTypeVo;
import com.jhta.project.vo.ShopItemImageVo;
import com.jhta.project.vo.ShopItemVo;

@Controller
public class ShopAdminController {
	@Resource(name="uploadPath")
    private String uploadPath;
	@Autowired private ShopAdminServiceImpl shopAdminService;
	@Autowired private ShopService shopService;
	@Autowired private ItemFilterServiceImpl itemfilterService;
	
	@RequestMapping("/shopadmin/itemadd")
	public String itemadd(Model model) {
		List<ShopClassVo> list = shopService.classlist();
		List<ShopFilterTypeVo> filtertype = shopAdminService.filtertypelist();
		List<ShopFilterContentVo> filtercontent = shopAdminService.filtercontentlist();
		model.addAttribute("filtertype", filtertype);
		model.addAttribute("filtercontent", filtercontent);
		model.addAttribute("classvo", list);
		return ".admin.shopadmin.itemadd";
	}
	@RequestMapping("/shopadmin/kategorie")
	public String kategorie(Model model) {
		List<ShopClassVo> list = shopService.classlist();
		model.addAttribute("classvo", list);
		return ".admin.shopadmin.kategorie";
	}
	@RequestMapping("/shopadmin/filterlist")
	public String filter(Model model) {
		List<ShopFilterTypeVo> list = shopAdminService.filtertypelist();
		model.addAttribute("list", list);
		return ".admin.shopadmin.filterlist";
	}
	@RequestMapping("/shopadmin/kategorieclassinsert")
	public String kategorieclassinsert(Model model,String classname) {
		shopAdminService.classinsert(classname);
		return "redirect:/shopadmin/kategorie";
	}
	@RequestMapping("/shopadmin/filtertypeinsert")
	public String filtertypeinsert(Model model,String filtertype) {
		System.out.println("filtertype : "+filtertype);
		shopAdminService.filtertypeinsert(filtertype);
		return "redirect:/shopadmin/filterlist";
	}
	@RequestMapping("/shopadmin/filtercontentinsert")
	public String filtercontent(Model model,String filtercontent,int ft_num) {
		System.out.println("ft_num : "+ft_num);
		System.out.println("filtertype : "+filtercontent);
		ShopFilterContentVo vo = new ShopFilterContentVo(0,ft_num,filtercontent);
		shopAdminService.filtercontentinsert(vo);
		return "redirect:/shopadmin/filterlist";
	}
	@RequestMapping("/shopadmin/kategoriefieldinsert")
	public String kategoriefieldinsert(Model model,int classselect,String field) {
		ShopFieldVo vo = new ShopFieldVo(0,classselect,field);
		shopAdminService.fieldinsert(vo);
		return "redirect:/shopadmin/kategorie";
	}
	@RequestMapping(value="/shopadmin/filtercontent",produces="application/json;charset=utf-8")
	@ResponseBody
	public String filtercontent(int ft_num) {
		List<ShopFilterContentVo>list = shopAdminService.filtercontent(ft_num);
		JSONObject obj=new JSONObject();
		obj.put("list",list);
		for(ShopFilterContentVo vo : list) {
			System.out.println(" ShopFilterContentVo : "+vo.getFc_name());
		}
		System.out.println(obj.toString());
		return obj.toString();	
	}
	@RequestMapping("/shopadmin/list")
	public String list(Model model,String fieldnum) {
		List<ShopClassJoinShopFieldVo> list = shopAdminService.list();
		if(fieldnum!=null) {
			HashMap<Object, Object> map = new HashMap<>();
			map.put("fieldnum", fieldnum);
			List<ShopItemVo> itemlist =	shopAdminService.itemlist(map);
			model.addAttribute("itemlist", itemlist);
		}
		model.addAttribute("classfield", list);
		System.out.println("필드넘 번호 : "+fieldnum );
		return ".admin.shopadmin.list";
	}
	@RequestMapping("/shopadmin/update")
	public String update(Model model,int p_num,int fieldnum) {
		ShopItemVo list = shopAdminService.itemgetinfo(p_num);
		List<ItemFilterVo> flist = shopAdminService.itemfiltergetinfo(p_num);
		List<ShopItemImageVo> ilist = shopAdminService.itemimggetinfo(p_num);
		List<ShopFilterTypeVo> filtertypevo=shopService.filtertype(fieldnum);
		List<ShopFilterTypeVo> filtertype = shopAdminService.filtertypelist();
		List<ShopFilterContentVo> filtercontent = shopAdminService.filtercontentlist();
		HashMap<Object, Object> map=new HashMap<>();
		for(ShopFilterTypeVo filter:filtertypevo) {
			int ft_num=filter.getFt_num();
			List<ShopFilterContentVo> filtercontentvo=shopService.filtercontent(ft_num);
			map.put(filter.getFt_num(), filtercontentvo);
		}
		model.addAttribute("filtertype", filtertype);
		model.addAttribute("filtercontent", filtercontent);
		model.addAttribute("list", list);
		model.addAttribute("flist", flist);
		model.addAttribute("ilist", ilist);
		model.addAttribute("filtertypevo",filtertypevo);
		model.addAttribute("fieldnum",fieldnum);
		model.addAttribute("map",map);
		return ".admin.shopadmin.update";
	}
	@RequestMapping("/shopadmin/fieldlist")
	@ResponseBody
	public HashMap<String, Object> fieldlist(ShopClassVo vo) {
		int classnum = vo.getClassnum();
		HashMap<String, Object> map= new HashMap<>();
		List<ShopClassVo> classvo= shopAdminService.classlist();
		List<ShopFieldVo> fieldvo=shopAdminService.fieldlist(classnum);
		map.put("fieldvo",fieldvo);
		map.put("classvo",classvo);
		System.out.println(fieldvo.toString());
		return map;
		
	}
	@RequestMapping("/shopadmin/updateOk")
	public String update(String p_num,String []filterchk,String filterrdo,ShopItemVo vo,MultipartFile file1,HttpSession session,MultipartHttpServletRequest filereq) {
		for(int i=0; i<filterchk.length;i++) {
			System.out.println("filterchk : "+filterchk[i]);
		}
		HashMap<String, Object> map=new HashMap<>();
		shopAdminService.imgdelete(p_num);
		itemfilterService.delete(p_num);
		System.out.println(vo.toString());
		shopAdminService.update(vo);
		map.put("p_num",p_num);
		List<MultipartFile> filelist=filereq.getFiles("multifile");
		System.out.println("파일파일파일 : "+filereq.getFiles("multifile"));
		for(MultipartFile mf : filelist) {
			String orgfilename=mf.getOriginalFilename();	
			String filename=UUID.randomUUID()+"_"+orgfilename;
			String savefilename=uploadPath+filename;

			try {
				mf.transferTo(new File(savefilename));
				map.put("savefilename",filename);
				shopAdminService.multifile(map);
			}catch(IllegalStateException ie) {
				ie.printStackTrace();
			}catch(IOException io) {
				io.printStackTrace();
			}
		}
		System.out.println("여기옴");
		for(int i=0; i<filterchk.length;i++) {
			HashMap<String, String> umap = new HashMap<>();
			umap.put("p_num", p_num);
			umap.put("fc_num", filterchk[i]);
			itemfilterService.uinsert(umap);
		}
		String orgfilename=file1.getOriginalFilename();
	
		String savefilename=UUID.randomUUID()+"_"+orgfilename;
		try {
		
			InputStream is=file1.getInputStream();
		
			FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+ savefilename);
		
			FileCopyUtils.copy(is, fos);
			fos.close();
			is.close();

			map.put("savefilename", savefilename);
		
			shopAdminService.itemimage(map);
			return "redirect:/shopadmin/list";
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return "redirect:/shopadmin/list";
		}
	}
	@RequestMapping("/shopadmin/insert")
	public String itemadd(String []filterchk,String filterrdo,ShopItemVo vo,MultipartFile file1,HttpSession session,MultipartHttpServletRequest filereq) {
		HashMap<String, Object> map=new HashMap<>();
		System.out.println(vo.toString());
		shopAdminService.itemadd(vo);
		int p_num=shopAdminService.maxpnum();
		map.put("p_num",p_num);
	
		List<MultipartFile> filelist=filereq.getFiles("multifile");
		
		for(MultipartFile mf : filelist) {
			String orgfilename=mf.getOriginalFilename();	
			String filename=UUID.randomUUID()+"_"+orgfilename;
			String savefilename=uploadPath+filename;
			System.out.println("filename : "+filename);
			try {
				mf.transferTo(new File(savefilename));
				map.put("savefilename",filename);
				shopAdminService.multifile(map);
			}catch(IllegalStateException ie) {
				ie.printStackTrace();
			}catch(IOException io) {
				io.printStackTrace();
			}
		}
		itemfilterService.insert(filterrdo);
		for(int i=0; i<filterchk.length;i++) {
			itemfilterService.insert(filterchk[i]);
		}
		String orgfilename=file1.getOriginalFilename();
	
		String savefilename=UUID.randomUUID()+"_"+orgfilename;
		try {
		
			InputStream is=file1.getInputStream();
		
			FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+ savefilename);
		
			FileCopyUtils.copy(is, fos);
			fos.close();
			is.close();

			map.put("savefilename", savefilename);
		
			shopAdminService.itemimage(map);
			return "redirect:/shopadmin/list";
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return "redirect:/shopadmin/list";
		}
	}
	@RequestMapping("/shopadmin/delete")
	public String delete(Model model,String p_num,String fieldnum) {
		shopAdminService.delete(p_num);
		return "redirect:/shopadmin/list?fieldnum="+fieldnum;
	}
	@RequestMapping(value="/shopadmin/getfilter",produces="application/json;charset=utf-8")
	@ResponseBody
	public String jsonlist(int classnum ,int fieldnum) {
		List<ShopFilterTypeVo> fieldlist = shopService.filtertype(fieldnum);
		JSONArray arr = new JSONArray(); 
		for(ShopFilterTypeVo filter:fieldlist) {
			JSONObject obj=new JSONObject();
			int ft_num=filter.getFt_num();
			List<ShopFilterContentVo> filtercontentvo=shopService.filtercontent(ft_num);
			obj.put("arrr", filtercontentvo);
			System.out.println("String.valueOf(filter.getFt_num()) : "+String.valueOf(filter.getFt_num()));
			arr.put(obj);
		}
		JSONObject ob=new JSONObject();
		ob.put("fieldlist",fieldlist);
		ob.put("arr",arr);
		System.out.println(ob);
		return ob.toString();	
	}
	
}
