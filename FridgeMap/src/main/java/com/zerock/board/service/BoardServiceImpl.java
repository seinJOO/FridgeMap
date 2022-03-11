package com.zerock.board.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.zerock.board.command.AlertVO;
import com.zerock.board.command.BoardVO;
import com.zerock.board.command.CommentVO;
import com.zerock.board.command.LikeVO;
import com.zerock.board.mapper.BoardMapper;
import com.zerock.board.util.Criteria;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper mapper;

	@Override
	public ArrayList<BoardVO> getAllList(Criteria cri) {
		ArrayList<BoardVO> vo = mapper.getAllList(cri);
		return vo;
	}

	@Override
	public int getTotal() {
		int total = mapper.getTotal();
		return total;
	}

	@Override
	public ArrayList<BoardVO> getCategoryList(Criteria cri) {
		ArrayList<BoardVO> vo = mapper.getCategoryList(cri);
		return vo;
	}

	@Override
	public int getCateTotal(Criteria cri) {
		int total = mapper.getCateTotal(cri);
		return total;
	}

	@Override
	public ArrayList<BoardVO> getKeywordList(Criteria cri) {
		ArrayList<BoardVO> vo = mapper.getKeywordList(cri);
		return vo;
	}

	@Override
	public int getKeyTotal(Criteria cri) {
		int total = mapper.getKeyTotal(cri);
		return total;
	}

	@Override
	public int regist(BoardVO vo) {
		int result = mapper.regist(vo);
		return result;		
	}

	@Override
	public BoardVO getContent(int board_num) {
		BoardVO vo = mapper.getContent(board_num);
		return vo;
	}

	@Override
	public ArrayList<CommentVO> getComment(int board_num) {
		ArrayList<CommentVO> vo = mapper.getComment(board_num);
		return vo;
	}

	@Override
	public void upHit(BoardVO vo, HttpServletRequest request, HttpServletResponse response) {
		
		int board_num =  vo.getBoard_num();
		int board_view = vo.getBoard_view();		
		
		Cookie[] arr = request.getCookies();// cookie를 이용해 방문자수 카운트  (쿠키를 생성하면 서버에 요청할 때 자동으로 request에 담겨서 전달됨)			
														//쿠키 검사(게시글 번호에 해당하는 쿠키값인지 확인)		
		boolean bool = true;
		for (Cookie c : arr) {
			if (c.getName().equals("hitNum"+board_num)) { 
				bool = false;
				break;
			}
		}
		//조회수 업데이트
		if (bool) {
			mapper.upHit(board_num);	//hitNum 값을 +1 해서 업데이트하는 메서드
		}	
		
		request.setAttribute("vo", vo);
	
		//쿠키 생성(처음에 쿠키값이 있는지 확인한 후에 업데이트 된 hit값을 넣어줘야 하기 때문에 쿠키는 마지막에 생성!)
		Cookie cookie = new Cookie("hitNum"+board_num, String.valueOf(board_view));
		cookie.setMaxAge(60*60);
		response.addCookie(cookie);
	}

	@Override
	public int writeComment(CommentVO vo, AlertVO avo) {
		int result = mapper.writeComment(vo);
		mapper.commentAlert(avo);
		return result;
		
	}

	@Override
	public int modifyContent(BoardVO vo) {
		int result = mapper.modifyContent(vo);
		return result;
	}

	@Override
	public int updateComment(CommentVO vo) {
		int result = mapper.updateComment(vo);
		return result;
	}

	@Override
	public int deleteComment(CommentVO vo) {
		int result = mapper.deleteComment(vo);
		return result;
	}

	@Override
	public int deleteContent(int board_num) {
		int result = mapper.deleteContent(board_num);
		return result;
	}

	@Override
	public int userLiked(LikeVO vo) {
		int result = mapper.userLiked(vo);
		return result;
	}

	@Override
	public int plusLike(LikeVO vo) {
		int result = 0;
		ArrayList<LikeVO> heart = mapper.getAllLikes();
		
		for(LikeVO lvo : heart) {
			if (lvo.getBoard_num() != vo.getBoard_num() && lvo.getUser_id() != vo.getUser_id()) {
				result = 1;
			}
		}
		
		if (result == 1 || heart.size() == 0) { //0은 처음에만!
			result = mapper.plusLike(vo);
			result += mapper.plusBoard(vo);
			result += mapper.alertLike(vo);
			result=1;				
		} 
		
		
		
		return result;
	}

	@Override
	public int getLikes(int board_num) {
		int result = mapper.getLikes(board_num);
		return result;
	}

	@Override
	public int minusLike(LikeVO vo) {
		int result = mapper.minusLike(vo);// heart에서 지우기
		result += mapper.minusBoard(vo);// board에서 하나 빼고
		result += mapper.alertUnlike(vo);// 얼랏에서 지우고
		result = 1;
		return result;
	}

	@Override
	public JsonObject uploadImageFile(MultipartFile file) {
		JsonObject jsonObject = new JsonObject();
		String fileRoot = "C:\\FridgeMapImages\\";
		String originalFileName = file.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		String saveFileName = UUID.randomUUID()+extension;
		File targetFile = new File(fileRoot+saveFileName);
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "http://localhost:8080/FridgeMapImages/"+saveFileName);
			jsonObject.addProperty("responseCode", "succcess");
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		} catch(IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}	
		return jsonObject;

	}

	
	
	
	

	
}
