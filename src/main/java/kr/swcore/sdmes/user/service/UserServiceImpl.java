package kr.swcore.sdmes.user.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sdmes.user.dao.UserDAO;
import kr.swcore.sdmes.user.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO userDao;

	@Override
	public boolean loginCheck(UserDTO dto,HttpSession session) {
		// TODO Auto-generated method stub
		boolean result = userDao.loginCheck(dto);
		if (result) {
			UserDTO dto2 = viewUser(dto);
			session.setAttribute("userId",dto2.getUserId());
			session.setAttribute("userName", dto2.getUserName());
		}
		return result;

	}

	@Override
	public void logout(HttpSession session) {
	// TODO Auto-generated method stub
		session.invalidate();
	}

	@Override
	public UserDTO viewUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return userDao.viewUser(dto);
	}

	@Override
	public int updPasswd(UserDTO dto) {
		// TODO Auto-generated method stub
		return userDao.updPasswd(dto);
	}
}
