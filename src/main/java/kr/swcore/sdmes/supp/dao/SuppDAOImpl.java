package kr.swcore.sdmes.supp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sdmes.supp.dto.SuppDTO;

@Repository
public class SuppDAOImpl implements SuppDAO {

	@Inject
	SqlSession sqlSession; 
	
	@Override
	public SuppDTO suppDetail(Integer SuppNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("supp.detailsupp", SuppNo);
	}

	@Override
	public List<SuppDTO> listSupp01() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("supp.listsupp01");
	}

	@Override
	public Integer insertSupp(SuppDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("supp.insertsupp", dto);
	}

	@Override
	public Integer updateSupp(SuppDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("supp.updatesupp", dto);
	}

	@Override
	public Integer deleteSupp(SuppDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("supp.deletesupp", dto);
	}

}
