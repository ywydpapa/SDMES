package kr.swcore.sdmes.cont.dao;

import kr.swcore.sdmes.cont.dto.ContDTO;
import kr.swcore.sdmes.cont.dto.ContFileDTO;

import java.util.List;

public interface ContFileDAO {
    List<ContFileDTO> listFile(ContDTO contDTO);
    Integer uploadFile(ContFileDTO contFileDTO);
    Integer deleteFile(ContFileDTO contFileDTO);
    Integer downloadFile(ContFileDTO contFileDTO);
}
