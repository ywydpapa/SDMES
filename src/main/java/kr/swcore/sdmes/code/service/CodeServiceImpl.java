package kr.swcore.sdmes.code.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.swcore.sdmes.code.dao.CodeDAO;
import kr.swcore.sdmes.code.dto.CodeDTO;

@Service
public class CodeServiceImpl implements CodeService {

	@Inject
	CodeDAO codeDao;
	
	@Override
	public CodeDTO codeDetail(Integer codeNo) {
		// TODO Auto-generated method stub
		return codeDao.codeDetail(codeNo); 
	}

	@Override
	public List<CodeDTO> listCode01() {
		// TODO Auto-generated method stub
		return codeDao.listCode01();
	}

	@Override
	public List<CodeDTO> listCode02(Integer motherCode) {
		// TODO Auto-generated method stub
		return codeDao.listCode02(motherCode);
	}

	@Override
	public List<CodeDTO> listCode03(Integer motherCode) {
		// TODO Auto-generated method stub
		return codeDao.listCode03(motherCode);
	}

	@Override
	public Integer insertCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.insertCode(dto);
	}

	@Override
	public Integer updateCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.updateCode(dto);
	}

	@Override
	public Integer deleteCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.deleteCode(dto);
	}

}
