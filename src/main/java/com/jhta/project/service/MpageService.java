package com.jhta.project.service;

import java.util.List;

import com.jhta.project.vo.IntroduceVo;
import com.jhta.project.vo.MpageVo;

public interface MpageService {
	List<MpageVo> list();
	int update(MpageVo vo);
}
