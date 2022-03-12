package com.zerock.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.zerock.user.command.UserVO;
import com.zerock.user.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserService user;
	
    //로그인 화면 처리
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}

	//회원가입 화면 처리
	@RequestMapping("/join")
	public String join() {
		return "user/join";	
	}
	
	//홈 화면 처리
	@RequestMapping("/home")
	public String home() {
		return "user/home";	
	}
	
	// 회원가입  처리 Join폼 처리
	@RequestMapping("/joinForm")
	public String joinForm(UserVO vo, RedirectAttributes RA) {
		
		// 서비스로 join을 처리해야 함.
		int result = user.join(vo);
		
		if(result==1) { 
			RA.addFlashAttribute("msg", "회원가입에 성공했습니다");
		}else {
			RA.addFlashAttribute("msg", "회원가입에 실패했습니다");
		}	
		return "redirect:/user/login";
	}


	@RequestMapping("/loginForm")
	public String loginForm(UserVO vo,
			HttpSession session,
			RedirectAttributes RA) {
		int result = user.login(vo);
		
		if(result == 1 ) { 
			session.setAttribute("user_id", vo.getUser_id()); 
			return "redirect:/user/home"; 
		}else {
			RA.addFlashAttribute("msg", "아이디 비밀번호를 확인하세요");
			return "redirect:/";
		}
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 아이디 중복체크
	@RequestMapping("/checkId")		
	@ResponseBody				
	public int CheckId(@RequestParam("user_id") String user_id) {
		int result = user.checkId(user_id);
		return result;
	}
	
	// 닉네임 중복체크
	@RequestMapping("/checkNick")		
	@ResponseBody					
	public int CheckNick(@RequestParam("user_nick") String user_nick) {
		int result = user.checkNick(user_nick);
		return result;
	}
	
	// 정보보기 화면
	@RequestMapping("/info")
	public String info(HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("user_id");
		UserVO vo = user.info(user_id);
		model.addAttribute("vo", vo);
		return "user/info";
	}
	// 정보수정 화면
	@RequestMapping("/updateInfo")
	public String updateInfo(UserVO vo, Model model) {
		model.addAttribute("vo", vo);
		return "user/updateInfo";
	}
	
	// 정보수정 폼 처리

	@RequestMapping("/updateInfoForm")	
	public String updateInfoForm(UserVO vo, RedirectAttributes RA) {
		int result = user.updateInfo(vo); 
		
		if(result==1) {
			RA.addFlashAttribute("msg", "회원정보가 수정되었습니다");
			return "redirect:/user/home";
		}else {
			RA.addFlashAttribute("msg", "회원정보 수정을 실패하였습니다");
			return "redirect:/user/home";
		}
	}	
	
	// 회원 탈퇴
	@RequestMapping("/delete")
	public String delete(HttpSession session ,RedirectAttributes RA) {
		String user_id = (String)session.getAttribute("user_id");
		int result = user.delete(user_id);	
		session.invalidate();
		RA.addFlashAttribute("msg", "회원탈퇴 처리 되었습니다");
		return "redirect:/";
	}
}
