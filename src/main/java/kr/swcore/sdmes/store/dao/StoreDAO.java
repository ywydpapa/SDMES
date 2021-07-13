package kr.swcore.sdmes.store.dao;

import java.util.List;

import kr.swcore.sdmes.store.dto.StoreDTO;

public interface StoreDAO {

	StoreDTO storedetail(Integer storeioNo);
	List<StoreDTO> listStore(StoreDTO dto);
	List<StoreDTO> listStorereq();
	List<StoreDTO> listgoodsio(StoreDTO dto);
	List<StoreDTO> listgoodGroupIo();
	List<StoreDTO> listsuppio();
	Integer insertStore(StoreDTO dto);
	Integer updateStore(StoreDTO dto);
	Integer deleteStore(StoreDTO dto);
	Integer insertStoreReq(StoreDTO dto);
}
