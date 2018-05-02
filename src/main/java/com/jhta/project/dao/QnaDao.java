package com.jhta.project.dao;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.QnaVo;

@Repository
public class QnaDao {
	@Autowired private SqlSession sqlsession;
	private final String NAMESPACE = "com.jhta.mybatis.QnaMapper";
	
	public List<QnaVo> qnaList(){
		return sqlsession.selectList(NAMESPACE + ".qnalist");
	}
	
	
	
	public int getCount(HashMap<String,Object> map) {
		return sqlsession.selectOne(NAMESPACE +".count",map);
	}
	public List<QnaVo> list(HashMap<String,Object> map){
		return sqlsession.selectList(NAMESPACE +".list",map);
	}
	//다음글 
	public QnaVo next(int num) {
		return sqlsession.selectOne(NAMESPACE +".next",num);
	}
	//이전글
	public QnaVo prev(int num) {
		return sqlsession.selectOne(NAMESPACE +".prev",num);
	}
	//조회수
	public int addHit(int num) {
		return sqlsession.update(NAMESPACE +".addHit",num);
	}
}
