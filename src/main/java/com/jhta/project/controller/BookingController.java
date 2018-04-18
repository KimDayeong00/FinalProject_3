package com.jhta.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookingController {
	@RequestMapping("/booking/list")
	public String list() {
		return ".booking.list";
	}
	@RequestMapping("/booking/test")
	public String llist() {
		return ".booking.test";
	}
}
