package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.PetSitterVo;

public interface PetSitterService {
	List<PetSitterVo> list(HashMap<String, String> map);
<<<<<<< HEAD
	
	PetSitterVo select(String ps_email);
=======
	List<PetSitterVo> alllist();
>>>>>>> branch 'jg' of https://github.com/KimDayeong00/FinalProject_3.git
}
