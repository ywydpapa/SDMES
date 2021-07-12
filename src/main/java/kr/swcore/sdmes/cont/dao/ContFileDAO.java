package kr.swcore.sdmes.cont.dao;

import kr.swcore.sdmes.cont.dto.ContDTO;
import kr.swcore.sdmes.cont.dto.ContFileDTO;

import java.util.List;

public interface ContFileDAO {
    List<ContFileDTO> listFile(ContFileDTO contFileDTO);
    Integer uploadFile(ContFileDTO contFileDTO);
    Integer uploadFileWithNew(ContFileDTO contFileDTO);
    Integer deleteFileWithFile(ContFileDTO contFileDTO);
    Integer deleteFile(ContFileDTO contFileDTO);
    ContFileDTO downloadFile(ContFileDTO contFileDTO);
}
