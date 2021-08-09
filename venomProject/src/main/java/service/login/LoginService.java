package service.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import Model.AuthinfoDTO;
import command.LoginCommandDTO;
import repository.LoginRepository;

public class LoginService {
	@Autowired
	LoginRepository loginRepository;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	public void login(LoginCommandDTO loginCommandDTO, HttpSession httpSession) {
		String userId = loginCommandDTO.getUserId();
		AuthinfoDTO authinfoDTO = loginRepository.login(userId);
		if (loginCommandDTO.getUserPw().equals(authinfoDTO.getUserPw())) {
			httpSession.setAttribute("authinfo" , authinfoDTO);
		}
	}
}
