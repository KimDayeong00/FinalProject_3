package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.PetSitterFilterVo;
import com.jhta.project.vo.PetSitterJoinFilterVo;
import com.jhta.project.vo.PetSitterVo;

public interface PetSitterService {
	List<PetSitterJoinFilterVo> list(HashMap<String, String> map);
	List<PetSitterJoinFilterVo> alllist();
	PetSitterVo select(String ps_email);
	List<PetSitterFilterVo> getFilter(String ps_email);
}
