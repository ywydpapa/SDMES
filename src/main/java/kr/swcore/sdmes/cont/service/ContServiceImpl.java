package kr.swcore.sdmes.cont.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import kr.swcore.sdmes.cont.dao.ContFileDAO;
import kr.swcore.sdmes.cont.dto.ContFileDTO;
import kr.swcore.sdmes.goods.dao.GoodsDAO;
import kr.swcore.sdmes.goods.dto.GoodsDTO;
import kr.swcore.sdmes.store.dao.StoreDAO;
import kr.swcore.sdmes.store.dto.StoreDTO;
import kr.swcore.sdmes.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import kr.swcore.sdmes.cont.dao.ContDAO;
import kr.swcore.sdmes.cont.dto.ContDTO;

@Service
public class ContServiceImpl implements ContService {

	@Inject
	ContDAO contDao;

	@Inject
	ContFileDAO contFileDAO;

	@Inject
	StoreDAO storeDAO;

	@Inject
	GoodsDAO goodsDAO;
	
	@Override
	public ContDTO contDetail(Integer contNo) {
		// TODO Auto-generated method stub
		return contDao.contDetail(contNo);
	}

	@Override
	public List<ContDTO> listCont() {
		// TODO Auto-generated method stub
		return contDao.listCont();
	}

	@Override
	public Integer insertCont(HttpSession session, ContDTO dto) {
		Integer compNo = (Integer) SessionInfoGet.getCompNo(session);
		Integer reuslt = 0;
		try{
			contDao.insertCont(dto);
			if(!dto.getTempFileld().equals("")){
				ContFileDTO contFileDTO = new ContFileDTO();
				contFileDTO.setContNo(dto.getContNo());
				contFileDTO.setTempFileld(dto.getTempFileld());
				contFileDTO.setCompNo(compNo);
				contFileDAO.uploadFileWithNew(contFileDTO);
			}
			reuslt = 1;
		} catch (Exception e){
			e.printStackTrace();
		}
		return reuslt;
	}

	@Override
	public Integer updateCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont(dto);
	}

	@Override
	public Integer deleteCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.deleteCont(dto);
	}

	@Override
	public Integer insertaddGoods(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertaddGoods(dto);
	}

	@Override
	public List<ContDTO> listaddGoods(Integer contNo) {
		// TODO Auto-generated method stub
		return contDao.listaddGoods(contNo);
	}

	@Override
	public Integer deleteaddgoods(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.deleteaddgoods(dto);
	}

	@Override
	public Integer updateaddgoods(ContDTO dto) {
		// TODO Auto-generated method stub
		Integer result = 0;
		try {
			contDao.updateaddgoods(dto);
			if(dto.getPrdQtyComplete() > 0){
				GoodsDTO goodsDTO = new GoodsDTO();
				goodsDTO = goodsDAO.goodsDetail(dto.getGoodsNo());

				StoreDTO storeDTO = new StoreDTO();
				storeDTO.setInoutTyp("I");	// 입고
				storeDTO.setGoodsNo(String.valueOf(dto.getGoodsNo()));
				storeDTO.setAttrib(null);
				storeDTO.setStoreUnit(goodsDTO.getGoodsUnit());
				storeDTO.setStoreQty(String.valueOf(dto.getPrdQtyComplete()));
				storeDTO.setLocateCode(null);
				storeDTO.setComment(null);
				storeDAO.insertStore(storeDTO);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<ContDTO> listPorder() {
		// TODO Auto-generated method stub
		return contDao.listPorder();
	}

	@Override
	public Integer setPorder(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.setPorder(dto);
	}

	@Override
	public List<ContDTO> listReq() {
		// TODO Auto-generated method stub
		return contDao.listReq();
	}

	@Override
	public Integer insertReq(HttpSession session, ContDTO dto) {
		Integer compNo = (Integer) SessionInfoGet.getCompNo(session);
		Integer reuslt = 0;
		try{
			contDao.insertReq(dto);
			if(!dto.getTempFileld().equals("")){
				ContFileDTO contFileDTO = new ContFileDTO();
				contFileDTO.setContNo(dto.getContNo());
				contFileDTO.setTempFileld(dto.getTempFileld());
				contFileDTO.setCompNo(compNo);
				contFileDAO.uploadFileWithNew(contFileDTO);
			}
			reuslt = 1;
		} catch (Exception e){
			e.printStackTrace();
		}
		return reuslt;
	}

	@Override
	public Integer reqOk(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.reqOk(dto);
	}

	@Override
	public Integer reqRj(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.reqRj(dto);
	}

	@Override
	public Integer updateReq(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateReq(dto);
	}
}
