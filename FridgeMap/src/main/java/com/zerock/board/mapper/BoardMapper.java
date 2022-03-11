package com.zerock.board.mapper;

import java.util.ArrayList;

import com.zerock.board.command.AlertVO;
import com.zerock.board.command.BoardVO;
import com.zerock.board.command.CommentVO;
import com.zerock.board.command.LikeVO;
import com.zerock.board.util.Criteria;

public interface BoardMapper {

	public ArrayList<BoardVO> getAllList(Criteria cri);
	public ArrayList<BoardVO> getKeywordList(Criteria cri);
	public ArrayList<BoardVO> getCategoryList(Criteria cri);
	public int getTotal();
	public int getCateTotal(Criteria cri);
	public int getKeyTotal(Criteria cri);
	public int regist(BoardVO vo); 
	public BoardVO getContent(int board_num);
	public ArrayList<CommentVO> getComment(int board_num);
	public int upHit(int board_num);
	public int writeComment(CommentVO vo);
	public int modifyContent(BoardVO vo);
	public int commentAlert(AlertVO vo);
	public int updateComment(CommentVO vo);
	public int deleteComment(CommentVO vo);
	public int deleteContent(int board_num);
	public int userLiked(LikeVO vo);
	public int plusLike(LikeVO vo);
	public int plusBoard(LikeVO vo);
	public int alertLike(LikeVO vo);
	public int getLikes(int board_num);
	public ArrayList<LikeVO> getAllLikes();
	public int minusLike(LikeVO vo);
	public int minusBoard(LikeVO vo);
	public int alertUnlike(LikeVO vo);
}
