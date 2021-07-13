package kr.swcore.sdmes.supp.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import kr.swcore.sdmes.store.dto.StoreDTO;
import org.springframework.stereotype.Service;

import kr.swcore.sdmes.supp.dao.SuppDAO;
import kr.swcore.sdmes.supp.dto.SuppDTO;

@Service
public class SuppServiceImpl implements SuppService {

	@Inject
	SuppDAO suppDao;
	
	@Override
	public List<SuppDTO> listSupp01(Integer storeioNo) {
		if(storeioNo != null){
			SuppDTO result = suppDao.suppDetail(storeioNo);
			return suppDao.listSupp01(result);
		}

		List<SuppDTO> resultList = suppDao.listSuppGroupIo();
		List<SuppDTO> returnList = new ArrayList<SuppDTO>();

		String str = "";
		Boolean save = false;
		SuppDTO newDTO = null;
		for(SuppDTO vo : resultList){
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

				newDTO = new SuppDTO();
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
			resultList.add(newDTO);
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
	public Integer insertSupp(SuppDTO dto) {
		// TODO Auto-generated method stub
		return suppDao.insertSupp(dto);
	}

	@Override
	public Integer updateSupp(SuppDTO dto) {
		// TODO Auto-generated method stub
		return suppDao.updateSupp(dto);
	}

	@Override
	public Integer deleteSupp(SuppDTO dto) {
		// TODO Auto-generated method stub
		return suppDao.deleteSupp(dto);
	}

	@Override
	public SuppDTO suppDetail(Integer suppNo) {
		// TODO Auto-generated method stub
		return suppDao.suppDetail(suppNo);
	}

}
