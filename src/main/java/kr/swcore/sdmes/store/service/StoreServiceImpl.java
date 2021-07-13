package kr.swcore.sdmes.store.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import kr.swcore.sdmes.supp.dto.SuppDTO;
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
		StoreDTO dto = new StoreDTO();
		return storeDao.listStore(dto);
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
	public List<StoreDTO> listgoodsio(Integer storeioNo) {
		if(storeioNo != null){
			StoreDTO result = storeDao.storedetail(storeioNo);
			return storeDao.listgoodsio(result);
		}
		
		List<StoreDTO> resultList = storeDao.listgoodGroupIo();
		List<StoreDTO> returnList = new ArrayList<StoreDTO>();

		String str = "";
		Boolean save = false;
		StoreDTO newDTO = null;
		for(StoreDTO vo : resultList){
			if(str.equals(vo.getGoodsTitle())){
				if(vo.getInoutTyp().equalsIgnoreCase("I")){
					newDTO.setInStoreQty(vo.getStoreQty());
				} else if(vo.getInoutTyp().equalsIgnoreCase("O")){
					newDTO.setOutStoreQty(vo.getStoreQty());
				}
				str = "";
			} else {
				if(newDTO != null){
					returnList.add(newDTO);
					save = false;
				}

				newDTO = new StoreDTO();
				newDTO.setGoodsTitle(vo.getGoodsTitle());
				newDTO.setGoodsType(vo.getGoodsType());
				newDTO.setGoodsUnit(vo.getGoodsUnit());
				newDTO.setGoodsModel(vo.getGoodsModel());
				newDTO.setStoreioNo(vo.getStoreioNo());
				if(vo.getInoutTyp().equalsIgnoreCase("I")){
					newDTO.setInStoreQty(vo.getStoreQty());
				} else if(vo.getInoutTyp().equalsIgnoreCase("O")){
					newDTO.setOutStoreQty(vo.getStoreQty());
				}
				str = vo.getGoodsTitle();
				save = true;
			}
		}

		if(save){
			returnList.add(newDTO);
			save = false;
		}

		for(int i=0; i<returnList.size(); i++){
			int InStoreQty = 0, OutSotreQty = 0, DiffStoreQty = 0;
			if(returnList.get(i).getInStoreQty() != null && returnList.get(i).getInStoreQty() != ""){
				InStoreQty = Integer.valueOf(returnList.get(i).getInStoreQty());
			} else {
				returnList.get(i).setInStoreQty("0");
			}

			if(returnList.get(i).getOutStoreQty() != null && returnList.get(i).getOutStoreQty() != ""){
				OutSotreQty = Integer.valueOf(returnList.get(i).getOutStoreQty());
			} else {
				returnList.get(i).setOutStoreQty("0");
			}

			if(InStoreQty > OutSotreQty){
				DiffStoreQty = InStoreQty - OutSotreQty;
				returnList.get(i).setDiffStoreQty(String.valueOf(DiffStoreQty));
			} else {
				returnList.get(i).setDiffStoreQty("0");
			}
		}

		return returnList;
	}

	@Override
	public List<StoreDTO> listsuppio(Integer storeioNo) {
		if(storeioNo != null){
			StoreDTO result = storeDao.storedetail(storeioNo);
			return storeDao.listsuppio(result);
		}

		List<StoreDTO> resultList = storeDao.listSuppGroupIo();
		List<StoreDTO> returnList = new ArrayList<StoreDTO>();

		String str = "";
		Boolean save = false;
		StoreDTO newDTO = null;
		for(StoreDTO vo : resultList){
			if(str.equals(vo.getSuppTitle())){
				if(vo.getInoutTyp().equalsIgnoreCase("I")){
					newDTO.setInStoreQty(vo.getStoreQty());
				} else if(vo.getInoutTyp().equalsIgnoreCase("O")){
					newDTO.setOutStoreQty(vo.getStoreQty());
				}
				str = "";
			} else {
				if(newDTO != null){
					returnList.add(newDTO);
					save = false;
				}

				newDTO = new StoreDTO();
				newDTO.setSuppTitle(vo.getSuppTitle());
				newDTO.setSuppType(vo.getSuppType());
				newDTO.setSuppUnit(vo.getSuppUnit());
				newDTO.setSuppModel(vo.getSuppModel());
				newDTO.setStoreioNo(vo.getStoreioNo());
				if(vo.getInoutTyp().equalsIgnoreCase("I")){
					newDTO.setInStoreQty(vo.getStoreQty());
				} else if(vo.getInoutTyp().equalsIgnoreCase("O")){
					newDTO.setOutStoreQty(vo.getStoreQty());
				}
				str = vo.getSuppTitle();
				save = true;
			}
		}

		if(save){
			returnList.add(newDTO);
			save = false;
		}

		for(int i=0; i<returnList.size(); i++){
			int InStoreQty = 0, OutSotreQty = 0, DiffStoreQty = 0;
			if(returnList.get(i).getInStoreQty() != null && returnList.get(i).getInStoreQty() != ""){
				InStoreQty = Integer.valueOf(returnList.get(i).getInStoreQty());
			} else {
				returnList.get(i).setInStoreQty("0");
			}

			if(returnList.get(i).getOutStoreQty() != null && returnList.get(i).getOutStoreQty() != ""){
				OutSotreQty = Integer.valueOf(returnList.get(i).getOutStoreQty());
			} else {
				returnList.get(i).setOutStoreQty("0");
			}

			if(InStoreQty > OutSotreQty){
				DiffStoreQty = InStoreQty - OutSotreQty;
				returnList.get(i).setDiffStoreQty(String.valueOf(DiffStoreQty));
			} else {
				returnList.get(i).setDiffStoreQty("0");
			}
		}

		return returnList;
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

	@Override
	public List<StoreDTO> listStorereq() {
		// TODO Auto-generated method stub
		return storeDao.listStorereq();
	}

}
