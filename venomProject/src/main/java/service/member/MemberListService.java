package service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.MemberDTO;
import command.MemberCommandDTO;
import repository.MemberRepository;

public class MemberListService {
	@Autowired
	MemberRepository memberRepository;
	public void memList(Model model) {
		List<MemberCommandDTO> list = memberRepository.memList();
		model.addAttribute("memberList", list);
	}
}
