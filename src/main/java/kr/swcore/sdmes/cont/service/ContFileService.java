package kr.swcore.sdmes.cont.service;

import kr.swcore.sdmes.cont.dto.ContDTO;
import kr.swcore.sdmes.cont.dto.ContFileDTO;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ContFileService {
    List<ContFileDTO> listFile(HttpSession session, ContFileDTO ContFileDTO);
    Integer uploadFile(HttpSession session, ContFileDTO contFileDTO, MultipartHttpServletRequest fileList);
    Integer deleteFile(HttpSession session, ContFileDTO contFileDTO);
    ContFileDTO downloadFile(HttpSession session, ContFileDTO contFileDTO);
}
