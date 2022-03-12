package com.zerock.board.controller;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.zerock.board.command.AlertVO;
import com.zerock.board.command.BoardVO;
import com.zerock.board.command.CommentVO;
import com.zerock.board.command.LikeVO;
import com.zerock.board.service.BoardService;
import com.zerock.board.util.Criteria;
import com.zerock.board.util.PageVO;



@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	Logger log = LoggerFactory.getLogger(BoardController.class);
	
	
	//글쓰기 화면처리
	@RequestMapping("/write") 
		public String write(Model model, Criteria cri) {
			model.addAttribute("cri",cri);
			return "board/writing";
		}
	
	//게시판 첫 화면
	@RequestMapping("/main")
	public String main(Model model, Criteria cri, HttpSession session) { //HttpSession session에 심은 값 확인하기~~
		int total = service.getTotal();
		cri.setBoard_category("main");
		ArrayList<BoardVO> vo =  service.getAllList(cri);
		
		model.addAttribute("list", vo);
		model.addAttribute("pageMaker", new PageVO(total, cri));
		
		return "board/mainList";
	}
	//첫 화면 이후 화면 페이징 및 연결
	@RequestMapping("/category")
	public String viewCate(Model model, Criteria cri) {
		int total = service.getCateTotal(cri);
		ArrayList<BoardVO> vo =  service.getCategoryList(cri);	
		model.addAttribute("list", vo);
		model.addAttribute("pageMaker", new PageVO(total, cri));
		
		return "board/"+cri.getBoard_category()+"List";	
	}
	
	// 제목 검색 기능
	@RequestMapping("/search")
	public String search(Criteria cri, Model model) {
		String category = cri.getBoard_category();
		int total = service.getKeyTotal(cri);
		ArrayList<BoardVO> vo = service.getKeywordList(cri);
		
		model.addAttribute("list",vo);
		model.addAttribute("pageMaker", new PageVO(total, cri));
		return "board/"+category+"List";			
	}
	
	// 글쓰기 기능 - 이미지 파일 업로드 적용 전 ㅠㅠㅠ
	@RequestMapping("/writeForm")
	public String regist(BoardVO vo) {
		service.regist(vo);
		return "redirect:/board/main";
	}
	
	
	// 글 보기 기능 + 조회수
	@RequestMapping("/viewContent")
	public String viewContent(Model model, @RequestParam("board_num") String board_num, Criteria cri, HttpServletRequest request, HttpServletResponse response, HttpSession session) {		
		BoardVO bvo = service.getContent(Integer.parseInt(board_num));
		ArrayList<CommentVO> cvo = service.getComment(Integer.parseInt(board_num));
		LikeVO vo = new LikeVO(Integer.parseInt(board_num),(String) session.getAttribute("user_id"));
		int result = service.userLiked(vo); //해당 글을 유저가 좋아요 했는지 가져오기
		
		service.upHit(bvo, request, response);
		model.addAttribute("result",result);
		model.addAttribute("board",bvo);
		model.addAttribute("comment",cvo);
		model.addAttribute("cri",cri);		
		return "board/content";
	}
	
	// 글 수정 화면처리
	@RequestMapping("/modify")
	public String modify(Model model, @RequestParam("board_num") String board_num, Criteria cri) {
		BoardVO bvo = service.getContent(Integer.parseInt(board_num));
		model.addAttribute("board",bvo);
		model.addAttribute("cri",cri);	
		return "board/modify";
	}
	
	// 글 수정 처리
	@RequestMapping("/modiForm")
	public String modifyForm(Model model, BoardVO vo, Criteria cri) {
		service.modifyContent(vo);
		ArrayList<CommentVO> cvo = service.getComment(vo.getBoard_num());
		model.addAttribute("board",vo);
		model.addAttribute("comment",cvo);
		model.addAttribute("cri",cri);
		return "board/content";
	}
	
	//글 삭제 처리
	@RequestMapping("/deleteContent")
	public String deleteComment(@RequestParam("board_num") String board_num) {
		service.deleteContent(Integer.parseInt(board_num));
		return "redirect:/board/main";
	}
	
	// 댓글 작성 기능
	@RequestMapping("commentRegist")
	public String commentRegist(Model model, CommentVO vo , Criteria cri, AlertVO avo) {
		service.writeComment(vo, avo);
		BoardVO bvo = service.getContent(vo.getBoard_num());
		ArrayList<CommentVO> cvo = service.getComment(vo.getBoard_num());
		model.addAttribute("board",bvo);
		model.addAttribute("comment",cvo);
		model.addAttribute("cri",cri);
		return "board/content";
	}
	
	//댓글 수정 기능
	@RequestMapping("updateComment")
	public String commentUpdate(Model model, CommentVO vo , Criteria cri) {
		service.updateComment(vo);
		BoardVO bvo = service.getContent(vo.getBoard_num());
		ArrayList<CommentVO> cvo = service.getComment(vo.getBoard_num());
		model.addAttribute("board",bvo);
		model.addAttribute("comment",cvo);
		model.addAttribute("cri",cri);
		return "board/content";
	}
	
	//댓글 삭제 기능
		@RequestMapping("deleteComment")
		public String commentDelete(Model model, CommentVO vo , Criteria cri) {
			service.deleteComment(vo);
			BoardVO bvo = service.getContent(vo.getBoard_num());
			ArrayList<CommentVO> cvo = service.getComment(vo.getBoard_num());
			model.addAttribute("board",bvo);
			model.addAttribute("comment",cvo);
			model.addAttribute("cri",cri);
			return "board/content";
		}
		
	//좋아요 추가(/like)
		@RequestMapping("Like")
		@ResponseBody
		public int likeHeart(@RequestParam("board_num") String board_num, HttpSession session) {
			LikeVO vo = new LikeVO(Integer.parseInt(board_num), (String)session.getAttribute("user_id"));
			service.plusLike(vo);
			int count = service.getLikes(Integer.parseInt(board_num));	//해당 글의 좋아요 수
			return count;
		}
		
		
	//좋아요 삭제(/unlike)
		@RequestMapping("unLike")
		@ResponseBody
		public int unlikeHeart(@RequestParam("board_num") String board_num, HttpSession session) {
			LikeVO vo = new LikeVO(Integer.parseInt(board_num), (String)session.getAttribute("user_id"));
			service.minusLike(vo);
			int count = service.getLikes(Integer.parseInt(board_num));
			return count;
		}
		
		@RequestMapping(value="/uploadImageFile",  method = RequestMethod.POST )
		@ResponseBody
		public JsonObject uploadImageFile(MultipartFile file)  {
			JsonObject jsonObject = service.uploadImageFile(file);
			return jsonObject;

		}
	
	
	
	
}
