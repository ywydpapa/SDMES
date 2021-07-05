package kr.swcore.sdmes.cont.service;

import kr.swcore.sdmes.cont.dto.ContDTO;
import kr.swcore.sdmes.cont.dto.ContFileDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContFileServiceImpl implements ContFileService{

    @Override
    public List<ContFileDTO> listFile(ContDTO contDTO) {
        return null;
    }

    @Override
    public Integer uploadFile(ContFileDTO contFileDTO) {
        return null;
    }

    @Override
    public Integer deleteFile(ContFileDTO contFileDTO) {
        return null;
    }

    @Override
    public Integer downloadFile(ContFileDTO contFileDTO) {
        return null;
    }
}