package kr.swcore.sdmes.cont.service;

import kr.swcore.sdmes.cont.dao.ContFileDAO;
import kr.swcore.sdmes.cont.dto.ContDTO;
import kr.swcore.sdmes.cont.dto.ContFileDTO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

@Service
public class ContFileServiceImpl implements ContFileService{

    @Inject
    ContFileDAO contFileDAO;

    public static String checkMimeType(InputStream file) throws IOException {
        return null;
    }

    @Override
    public List<ContFileDTO> listFile(HttpSession session, ContDTO contDTO) {
        return null;
    }

    @Override
    public Integer uploadFile(HttpSession session, ContFileDTO contFileDTO, MultipartHttpServletRequest fileList) {
        Integer insertUserNo = Integer.valueOf((String)session.getAttribute("userNo"));
        String fileDesc = fileList.getParameter("fileDesc") != null ? fileList.getParameter("fileDesc") : "";
        String uuid = UUID.randomUUID().toString() + System.currentTimeMillis();

        try {
            MultipartFile file = fileList.getFile("file");
            contFileDTO.setFileId(uuid);
            contFileDTO.setFileName(file.getOriginalFilename());
            contFileDTO.setFileContent(file.getBytes());
            contFileDTO.setFileDesc(fileDesc);
            contFileDTO.setInsertUserNo(insertUserNo);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return contFileDAO.uploadFile(contFileDTO);
    }

    @Override
    public Integer deleteFile(HttpSession session, ContFileDTO contFileDTO) {
        return null;
    }

    @Override
    public ContFileDTO downloadFile(HttpSession session, ContFileDTO contFileDTO) {
        return null;
    }
}