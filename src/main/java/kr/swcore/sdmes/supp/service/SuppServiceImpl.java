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
	public List<SuppDTO> listSupp01(SuppDTO dto) {
		return suppDao.listSupp01(dto);
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
