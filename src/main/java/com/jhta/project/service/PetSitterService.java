package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.PetSitterVo;

public interface PetSitterService {
	List<PetSitterVo> list(HashMap<String, String> map);
	List<PetSitterVo> alllist();
}
