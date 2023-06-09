package com.myezen.myapp.service;

import java.util.ArrayList;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.SearchCriteria;

public interface BoardService {

	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri);
	
	public int boardTotal(SearchCriteria scri);
	
	public BoardVo boardSelectOne(int bidx);
	
	public int boardInsert(BoardVo bv);
	
	public int boardInsert2(BoardVo bv);

	public int boardInsert3(BoardVo bv);
	
	public int boardModify(BoardVo bv);
	
	public int boardDelete(BoardVo bv);
	
	public int boardReply(BoardVo bv);
	
	public int adminboardDelete(BoardVo bv);
	public int adminboardBack(BoardVo bv);



	int boardView(int bidx);

	public BoardVo boardSelectQna(int bidx);

	public ArrayList<BoardVo> boardSelectAll2(SearchCriteria scri);

	public int boardTotal2(SearchCriteria scri);

	
	

}
