package kr.swcore.sdmes.cont.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sdmes.cont.dto.ContDTO;

@Repository
public class ContDAOImpl implements ContDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public ContDTO contDetail(Integer contNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cont.detailcont", contNo);
	}

	@Override
	public List<ContDTO> listCont() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listcont");
	}

	@Override
	public Integer insertCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.insertcont", dto); 
	}

	@Override
	public Integer updateCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updatecont", dto);
	}

	@Override
	public Integer deleteCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cont.deletecont", dto);
	}

	@Override
	public Integer insertaddGoods(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.addgoods", dto);
	}

	@Override
	public List<ContDTO> listaddGoods(Integer contNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.addgoodslist", contNo);
	}

	@Override
	public Integer deleteaddgoods(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.deleteaddgoods", dto);
	}

	@Override
	public Integer updateaddgoods(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updateaddgoods", dto);
	}

	@Override
	public List<ContDTO> listPorder() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listporder");
	}

	@Override
	public Integer setPorder(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.setPorder", dto);
	}

	@Override
	public List<ContDTO> listReq() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listreq");
	}

	@Override
	public Integer insertReq(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.insertreq", dto);
	}

}
