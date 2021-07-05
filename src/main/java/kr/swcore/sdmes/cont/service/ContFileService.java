package kr.swcore.sdmes.cont.service;

import kr.swcore.sdmes.cont.dto.ContDTO;
import kr.swcore.sdmes.cont.dto.ContFileDTO;

import java.util.List;

public interface ContFileService {
    List<ContFileDTO> listFile(ContDTO contDTO);
    Integer uploadFile(ContFileDTO contFileDTO);
    Integer deleteFile(ContFileDTO contFileDTO);
    Integer downloadFile(ContFileDTO contFileDTO);
}
