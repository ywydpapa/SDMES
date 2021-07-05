package kr.swcore.sdmes.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sdmes.user.dto.UserDTO;

@Service
public interface UserService {

	public boolean loginCheck(UserDTO dto, HttpSession session);
	public UserDTO viewUser(UserDTO dto);
	public void logout(HttpSession session);
	public int updPasswd(UserDTO dto);
}