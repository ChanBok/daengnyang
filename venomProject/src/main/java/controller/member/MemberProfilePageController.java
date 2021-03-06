package controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.member.MemberProfilePageService;

@Controller
public class MemberProfilePageController {
	
	@Autowired
	MemberProfilePageService memberProfileService; 
	@RequestMapping("profilePage")
	public String myPage(HttpSession httpSession, Model model) {
		memberProfileService.memberInformation(httpSession, model);
		return "member/memProfilePage";
	}
	
}
