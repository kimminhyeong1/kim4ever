package com.myezen.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.SearchCriteria;

public interface BoardService_Mapper {

	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri);
	public ArrayList<BoardVo> boardSelectAll2(SearchCriteria scri);

	
	public int boardTotal(SearchCriteria scri);
		
	public BoardVo boardSelectOne(int bidx);
	public BoardVo boardSelectQna(int bidx);


	public int boardInsert(BoardVo bv);	//공지
	public int boardInsert2(BoardVo bv); 	//qna
	public int boardInsert3(BoardVo bv); 	//faq
	public void boardInsertUpdate();//업데이트 rebidx
	
	public int boardModify(BoardVo bv);

	public int boardDelete(BoardVo bv);


	public int boardView(int bidx);

	public int boardReplyUpdate(HashMap hm);
	
	public int boardReplyInsert(BoardVo bv);
	public int boardTotal2(SearchCriteria scri);
	public int adminboardDelete(BoardVo bv);
	public int adminboardBack(BoardVo bv);

	
}
	

