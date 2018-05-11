package com.jhta.project.service;

import java.util.HashMap;

public interface ItemFilterService {
	int insert(String filterchk);
	int delete(String p_num);
	int uinsert(HashMap<String, String> umap);
}
