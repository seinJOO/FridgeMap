package com.zerock.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.user.command.UserVO;
import com.zerock.user.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService {

	
	@Autowired //
	private UserMapper mapper;
	
	@Override
	public int checkId(String user_id) {
		int result = mapper.checkId(user_id);

		return result;
	}
	
	@Override
	public int checkNick(String user_nick) {	
		int result = mapper.checkNick(user_nick);
		
		return result;
	}
	
	
	@Override
	public int join(UserVO vo) {
		int result = mapper.join(vo);
		
		return result;
	}
	
	@Override
	public int login(UserVO vo) {
		int result = mapper.login(vo);
		
		return result;
	}
	
	@Override
	public UserVO info(String user_id) {
		UserVO vo = mapper.info(user_id);
		return vo;
	}
	
	@Override
	public int updateInfo(UserVO vo) {
		int result = mapper.updateInfo(vo);
		System.out.println("업데이트??===="+result);
		return result;
	}
	
	@Override
	public int delete(String user_id) {
		int result = mapper.delete(user_id);
		return result;
	}
	
	
	
}
