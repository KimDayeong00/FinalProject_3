package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.DisableDateDao;
import com.jhta.project.vo.DisableDateVo;

@Service
public class DisableDateService {
	@Autowired private DisableDateDao dao;
	
	public List<DisableDateVo> getDisable(String ps_email) {
		return dao.getDisable(ps_email);
	}
}
