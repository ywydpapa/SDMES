package kr.swcore.sdmes.user.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sdmes.user.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(UserDTO dto) {
		// TODO Auto-generated method stub
		String name = sqlSession.selectOne("user.loginCheck", dto);
		return (name == null) ? false:true;
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserDTO viewUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.viewUser", dto);
	}

	@Override
	public int updPasswd(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.updPasswd",dto);
	}

	@Override
	public List<UserDTO> listUser() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.listuser");
	}

	@Override
	public int updRole(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.updRole", dto);
	}

	
}
