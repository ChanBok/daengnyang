package service.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthinfoDTO;
import Model.MemberDTO;
import repository.MemberRepository;

public class MemberProfilePageService {
	
	@Autowired
	MemberRepository memberRepository; 
	public void memberInformation(HttpSession httpSession , Model model) {
		AuthinfoDTO authinfoDTO = (AuthinfoDTO)httpSession.getAttribute("authinfo");
		String userId = authinfoDTO.getUserId();
		MemberDTO dto = memberRepository.memberInformation(userId);
		model.addAttribute("memberDTO" , dto);
	}
}
