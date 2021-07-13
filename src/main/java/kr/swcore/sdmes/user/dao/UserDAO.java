package kr.swcore.sdmes.user.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sdmes.user.dto.UserDTO;

public interface UserDAO {
	
	public boolean loginCheck(UserDTO dto);
	public void logout(HttpSession session);
	public UserDTO viewUser(UserDTO dto);
	public int updPasswd(UserDTO dto);
	public List<UserDTO> listUser();
}
