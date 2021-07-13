package kr.swcore.sdmes.store.service;

import java.util.List;

import kr.swcore.sdmes.store.dto.StoreDTO;
import kr.swcore.sdmes.supp.dto.SuppDTO;

public interface StoreService {

	StoreDTO storedetail(Integer storeioNo);
	List<StoreDTO> listStore();
	List<StoreDTO> listStorereq();
	List<StoreDTO> listgoodsio(Integer storeioNo);
	List<StoreDTO> listsuppio(Integer storeioNo);
	Integer insertStore(StoreDTO dto);
	Integer updateStore(StoreDTO dto);
	Integer deleteStore(StoreDTO dto);
	Integer insertStoreReq(StoreDTO dto);
}
