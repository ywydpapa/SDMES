package kr.swcore.sdmes.code.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sdmes.code.dto.CodeDTO;

@Repository
public class CodeDAOImpl implements CodeDAO {

	@Inject
	SqlSession sqlSession; 
	
	@Override
	public CodeDTO codeDetail(Integer codeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("code.detailcode", codeNo);
	}

	@Override
	public List<CodeDTO> listCode01() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listcode01");
	}

	@Override
	public List<CodeDTO> listCode02(Integer motherCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listcode02",motherCode);
	}
	
	@Override
	public List<CodeDTO> listCode02con(Integer motherCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listcode02con",motherCode);
	}

	@Override
	public List<CodeDTO> listCode03(Integer motherCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listcode03",motherCode);
	}

	@Override
	public Integer insertCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("code.insertcode", dto);
	}

	@Override
	public Integer updateCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("code.updatecode", dto);
	}

	@Override
	public Integer deleteCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("code.deletecode", dto);
	}

}
