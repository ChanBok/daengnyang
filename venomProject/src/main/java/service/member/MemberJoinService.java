package service.member;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import Model.MemberDTO;
import command.MemberCommandDTO;
import repository.MemberRepository;

public class MemberJoinService {
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	public void memJoin(MemberCommandDTO memberCommandDTO, HttpSession httpSession) {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemId(memberCommandDTO.getMemId());
		memberDTO.setMemPw(memberCommandDTO.getMemPw());
		memberDTO.setMemName(memberCommandDTO.getMemName());
		memberDTO.setMemBirth(memberCommandDTO.getMemBirth());
		memberDTO.setMemGender(memberCommandDTO.getMemGender());
		memberDTO.setMemPhone(memberCommandDTO.getMemPhone());
		memberDTO.setPostNum(memberCommandDTO.getPostNum());
		memberDTO.setMemAdd(memberCommandDTO.getMemAdd());
		memberDTO.setAddDetail(memberCommandDTO.getAddDetail());
		memberDTO.setMemIntro(memberCommandDTO.getMemIntro());
		memberDTO.setMemPetCk(memberCommandDTO.getMemPetCk());
		memberDTO.setPetDn(memberCommandDTO.getPetDn());
		memberDTO.setPetKind(memberCommandDTO.getPetKind());
		memberDTO.setPetName(memberCommandDTO.getPetName());
		memberDTO.setPetAge(memberCommandDTO.getPetAge());
		memberDTO.setPetGender(memberCommandDTO.getPetGender());
		memberDTO.setPetIntro(memberCommandDTO.getPetIntro());
		String memImage = "";
		if (!memberCommandDTO.getMemImage()[0].getOriginalFilename().equals("")) {
			for (MultipartFile mf : memberCommandDTO.getMemImage()) {
				String original = mf.getOriginalFilename();
				String originalExt = original.substring(original.lastIndexOf("."));
				String store = UUID.randomUUID().toString().replace("-", "") + originalExt;
				memImage += store + ",";
				String realPath = httpSession.getServletContext().getRealPath("WEB-INF/view/member/profile");
				File file = new File(realPath + "/" + store);
				try {
					mf.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			memberDTO.setMemImage(memImage);
		}
		String petImage = "";
		if (!memberCommandDTO.getPetImage()[0].getOriginalFilename().equals("")) {
			for (MultipartFile mf : memberCommandDTO.getPetImage()) {
				String original = mf.getOriginalFilename();
				String originalExt = original.substring(original.lastIndexOf("."));
				String store = UUID.randomUUID().toString().replace("-", "") + originalExt;
				petImage += store + ",";
				String realPath = httpSession.getServletContext().getRealPath("WEB-INF/view/member/profile");
				File file = new File(realPath + "/" + store);
				try {
					mf.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			memberDTO.setPetImage(petImage);
		}
		memberRepository.memJoin(memberDTO);
	}
}
