package kr.swcore.sdmes.store.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.swcore.sdmes.store.dao.StoreDAO;
import kr.swcore.sdmes.store.dto.StoreDTO;

@Service
public class StoreServiceImpl implements StoreService {

	@Inject
	StoreDAO storeDao;
	
	@Override
	public List<StoreDTO> listStore() {
		// TODO Auto-generated method stub
		return storeDao.listStore();
	}

	@Override
	public Integer insertStore(StoreDTO dto) {
		// TODO Auto-generated method stub
		return storeDao.insertStore(dto);
	}

	@Override
	public Integer updateStore(StoreDTO dto) {
		// TODO Auto-generated method stub
		return storeDao.updateStore(dto);
	}

	@Override
	public Integer deleteStore(StoreDTO dto) {
		// TODO Auto-generated method stub
		return storeDao.deleteStore(dto);
	}

	@Override
	public List<StoreDTO> listgoodsio() {
		// TODO Auto-generated method stub
		return storeDao.listgoodsio();
	}

	@Override
	public List<StoreDTO> listsuppio() {
		// TODO Auto-generated method stub
		return storeDao.listsuppio();
	}

	@Override
	public StoreDTO storedetail(Integer storeioNo) {
		// TODO Auto-generated method stub
		return storeDao.storedetail(storeioNo);
	}

	@Override
	public Integer insertStoreReq(StoreDTO dto) {
		// TODO Auto-generated method stub
		return storeDao.insertStoreReq(dto);
	}

}
