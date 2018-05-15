package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.PetSitterImageVo;

public interface PetSitterImageService {
	int insert(HashMap<String, Object> map);
	int delete(int pimg_num);
	List<PetSitterImageVo> getImg(String ps_email);
}
