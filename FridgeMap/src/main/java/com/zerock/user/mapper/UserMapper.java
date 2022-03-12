package com.zerock.user.mapper;

import com.zerock.user.command.UserVO;

public interface UserMapper {
	
	public int checkId(String user_id); // 아이디 중복 확인
	public int checkNick(String user_nick); // 닉네임 중복 확인
	public int join(UserVO vo); // 회원가입
	public int login(UserVO vo); // 로그인
	public UserVO info(String user_id); // 회원정보 보기
	public int updateInfo(UserVO vo); // 회원정보 수정
	public int delete(String user_id); // 회원정보 삭제

}
 