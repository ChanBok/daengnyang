package controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.LoginCommandDTO;
import service.login.LoginService;

@Controller
@RequestMapping("login")
public class LoginController {
	@RequestMapping(method = RequestMethod.GET)
	public String main() {
		return "redirect:/";
	}
	@Autowired
	LoginService loginService;
	@RequestMapping(method = RequestMethod.POST)
	public String login(LoginCommandDTO loginCommandDTO, HttpSession httpSession) {
		loginService.login(loginCommandDTO, httpSession);
		return "redirect:/";
	}
	@RequestMapping("logout")
	public String logOut(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:/";
	}
}
