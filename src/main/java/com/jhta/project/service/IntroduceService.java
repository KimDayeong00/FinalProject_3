package com.jhta.project.service;

import java.util.List;

import com.jhta.project.vo.IntroduceVo;

public interface IntroduceService {
	List<IntroduceVo> list();
	int update(IntroduceVo vo);
}
