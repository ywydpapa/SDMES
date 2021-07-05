package kr.swcore.sdmes.cont.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.swcore.sdmes.cont.dao.ContDAO;
import kr.swcore.sdmes.cont.dto.ContDTO;

@Service
public class ContServiceImpl implements ContService {

	@Inject
	ContDAO contDao;
	
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
	public Integer insertCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont(dto);
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
		return contDao.updateaddgoods(dto);
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

}
