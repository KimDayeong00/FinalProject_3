package com.jhta.project.util;

import java.util.HashMap;
import java.util.Map;

public class Dogs {

	Map<String, String> dList = new HashMap<>();

	public String dogC(String dog) {
		String dogResult = "";
		dList.put("Chihuahua", "치와와");
		dList.put("golden retriever", "리트리버");
		dList.put("Pembroke", "웰시 코기");

		for (Map.Entry<String, String> entry : dList.entrySet()) {
			if (entry.getKey().equals(dog)) {
				dogResult = entry.getValue();
			}
		}
		if (dogResult.equals("")) {
			dogResult = dog;
		}
		return dogResult;
	}

}
