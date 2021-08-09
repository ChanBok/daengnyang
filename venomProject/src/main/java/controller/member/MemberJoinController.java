package controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Model.MemberDTO;
import command.MemberCommandDTO;
import oracle.net.aso.h;
import service.member.MemberJoinService;

@Controller
public class MemberJoinController {
	
	@RequestMapping("memJoinPage")
	public String MoveMemJoinPage() {
		return "member/memJoinPage";
	}
	
	@Autowired
	MemberJoinService memberJoinService;
	@RequestMapping(value="memJoin", method = RequestMethod.POST)
	public String memJoin(MemberCommandDTO memberCommandDTO , HttpSession httpSession) {
		memberJoinService.memJoin(memberCommandDTO , httpSession);
		return "redirect:/";
	}
	
}
