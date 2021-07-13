package kr.swcore.sdmes.store.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sdmes.store.dto.StoreDTO;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<StoreDTO> listStore() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("store.liststore");
	}

	@Override
	public Integer insertStore(StoreDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("store.insertstore", dto);
	}

	@Override
	public Integer updateStore(StoreDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("store.updatestore", dto);
	}

	@Override
	public Integer deleteStore(StoreDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("store.deletestore", dto);
	}

	@Override
	public List<StoreDTO> listgoodsio() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("store.listgoodsio");
	}

	@Override
	public List<StoreDTO> listsuppio() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("store.listsuppio");
	}

	@Override
	public StoreDTO storedetail(Integer storeioNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("store.detailstoreio", storeioNo);
	}

	@Override
	public Integer insertStoreReq(StoreDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("store.insertstoreReq", dto);
	}

	@Override
	public List<StoreDTO> listStorereq() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("store.liststorereq");
	}

}
