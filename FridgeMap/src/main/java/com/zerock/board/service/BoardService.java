package com.zerock.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerock.board.command.AlertVO;
import com.zerock.board.command.BoardVO;
import com.zerock.board.command.CommentVO;
import com.zerock.board.command.Criteria;
import com.zerock.board.command.LikeVO;

public interface BoardService {
	
	public ArrayList<BoardVO> getAllList(Criteria cri);
	public ArrayList<BoardVO> getCategoryList(Criteria cri);
	public ArrayList<BoardVO> getKeywordList(Criteria cri);
	public int getTotal();
	public int getCateTotal(Criteria cri);
	public int getKeyTotal(Criteria cri);
	public int regist(BoardVO vo);
	public BoardVO getContent(int board_num);
	public ArrayList<CommentVO> getComment(int board_num);
	public void upHit(BoardVO vo, HttpServletRequest request, HttpServletResponse response);
	public int writeComment(CommentVO vo, AlertVO avo);
	public int modifyContent(BoardVO vo);
	public int updateComment(CommentVO vo);
	public int deleteComment(CommentVO vo);
	public int deleteContent(int board_num);
	public int userLiked(LikeVO vo); // 해당 글에 유저가 좋아요했는지 가져오기
	public int plusLike(LikeVO vo);
	public int getLikes(int board_num); // 해당 글의 좋아요 개수만 가져오기
	public int minusLike(LikeVO vo);
}
