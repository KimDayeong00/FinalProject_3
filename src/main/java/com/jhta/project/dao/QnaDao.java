package com.jhta.project.dao;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.AdminqnaVo;
import com.jhta.project.vo.PayboardVo;
import com.jhta.project.vo.QnaVo;
import com.jhta.project.vo.ShopItemVo;

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
	public List<QnaVo> adminlist(HashMap<String,Object> map){
		return sqlsession.selectList(NAMESPACE +".adminlist",map);
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
	
	
	
	public List<ShopItemVo> orderiteminfo(String m_email) {
		return sqlsession.selectList(NAMESPACE + ".orderiteminfo", m_email);
	}
	public int insert(QnaVo vo) {
		return sqlsession.insert(NAMESPACE + ".insert", vo);
	}
	public QnaVo qungetinfo(int p_num) {
		return sqlsession.selectOne(NAMESPACE + ".qnagetinfo", p_num);
	}
	public List<QnaVo> qnagetlist(String m_email) {
		return sqlsession.selectList(NAMESPACE + ".qnagetlist", m_email);
	}
	public int qnadelete(int qnum) {
		return sqlsession.delete(NAMESPACE + ".qnadelete", qnum);
	}
	public int admindelete(int qnum) {
		return sqlsession.delete(NAMESPACE + ".admindelete", qnum);
	}
	
	public int maxnum() {
		return sqlsession.selectOne(NAMESPACE + ".maxnum");
	}
	
	public int adminupdate(int qnum) {
		return sqlsession.update(NAMESPACE + ".adminupdate", qnum);
	}
	
	public int adminqnainsert(AdminqnaVo vo) {
		return sqlsession.insert(NAMESPACE + ".adminqnainsert", vo);
	}
	public QnaVo detailone(int qnum) {
		return sqlsession.selectOne(NAMESPACE + ".detailone", qnum);
	}
}
