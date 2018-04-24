package com.jhta.project.util;

public class PageUtil {
	private int pageNum; //현재페이지
	private int startRow; //시작행번호
	private int endRow;  //끝행번호
	private int totalPageCount; //전체페이지갯수
	private int startPageNum; //시작페이지번호
	private int endPageNum; //끝페이지번호
	private int rowBlockCount; //한페이지에 보여질 글의 갯수
	private int pageBlockCount; //한페이지에 보여질 페이지 갯수
	private int totalRowCount; //전체글의 갯수
	
	public PageUtil() {}
	public PageUtil(int pageNum,int rowBlockCount,int pageBlockCount,int totalRowCount) {
		this.pageNum=pageNum;
		this.rowBlockCount=rowBlockCount;
		this.pageBlockCount=pageBlockCount;
		this.totalRowCount=totalRowCount;
		
		startRow=(pageNum-1)*rowBlockCount+1;//시작행번호
		endRow=startRow+rowBlockCount-1; //끝행번호
		totalPageCount=(int)Math.ceil(totalRowCount/(double)rowBlockCount); //전체페이지갯수
		startPageNum=(pageNum-1)/pageBlockCount*pageBlockCount+1;//시작페이지번호
		endPageNum=startPageNum+pageBlockCount-1;//끝페이지번호
		if(endPageNum>totalPageCount) {
			endPageNum=totalPageCount;
		}
	}
	public int getPageNum() {
		return pageNum;
	}
	public int getStartRow() {
		return startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public int getRowBlockCount() {
		return rowBlockCount;
	}
	public int getPageBlockCount() {
		return pageBlockCount;
	}
	public int getTotalRowCount() {
		return totalRowCount;
	}
}

