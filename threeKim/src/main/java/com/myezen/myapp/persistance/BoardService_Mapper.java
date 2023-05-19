package com.myezen.myapp.persistance;

import java.util.ArrayList;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.SearchCriteria;

public interface BoardService_Mapper {

	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri);
	
	public int boardTotal(SearchCriteria scri);
	
	public int boardViewCnt(int bidx);
	
	public BoardVo boardSelectOne(int bidx);

	public int boardInsert(BoardVo bv);

	public int boardModify(BoardVo bv);

	public int boardDelete(BoardVo bv);

	public int boardReply(BoardVo bv);
	

}
