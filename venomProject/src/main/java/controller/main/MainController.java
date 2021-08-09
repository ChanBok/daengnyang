package controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.member.MemberListService;

@Controller
public class MainController {
	
	@RequestMapping("main")
	public String mainPage() {
		return "main/main";
	}

	@RequestMapping("loginPage")
	public String loginPage() {
		return "login/loginPage";
	}

}
