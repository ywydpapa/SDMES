package kr.swcore.sdmes.cont.service;

import kr.swcore.sdmes.cont.dao.ContFileDAO;
import kr.swcore.sdmes.cont.dto.ContFileDTO;
import org.apache.tika.Tika;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.UUID;

@Service
public class ContFileServiceImpl implements ContFileService{

    @Inject
    ContFileDAO contFileDAO;

    public static String checkMimeType(InputStream file) throws IOException {
        Tika tika = new Tika();
        String mimeType = tika.detect(file);
        mimeType = mimeType.replaceAll(" ","");
        mimeType = StringUtils.isEmpty(mimeType) ? "" : mimeType;
        return mimeType;
    }

    @Override
    public List<ContFileDTO> listFile(HttpSession session, ContFileDTO contFileDTO) {
        return contFileDAO.listFile(contFileDTO);
    }

    @Override
    public Integer uploadFile(HttpSession session, ContFileDTO contFileDTO, MultipartHttpServletRequest fileList) {
        Integer insertUserNo = (Integer) session.getAttribute("userNo");
        String fileDesc = fileList.getParameter("fileDesc") != null ? fileList.getParameter("fileDesc") : "";
        String uuid = UUID.randomUUID().toString() + System.currentTimeMillis();
        try {
            MultipartFile file = fileList.getFile("file");
            InputStream inputStream = file.getInputStream();
            String checkMimeType = checkMimeType(inputStream);
            Long fileSize = file.getSize();

            contFileDTO.setFileId(uuid);
            contFileDTO.setFileName(new String(file.getOriginalFilename().getBytes("8859_1"), StandardCharsets.UTF_8));
            contFileDTO.setFileDesc(new String(fileDesc.getBytes("8859_1"), StandardCharsets.UTF_8));
            contFileDTO.setFileContent(file.getBytes());
            contFileDTO.setFileSize(fileSize);
            contFileDTO.setFileType(checkMimeType);
            contFileDTO.setInsertUserNo(insertUserNo);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Integer result = contFileDAO.uploadFile(contFileDTO);
        return result;
    }

    @Override
    public Integer deleteFile(HttpSession session, ContFileDTO contFileDTO) {
        return contFileDAO.deleteFile(contFileDTO);
    }

    @Override
    public ContFileDTO downloadFile(HttpSession session, ContFileDTO contFileDTO) {
        return contFileDAO.downloadFile(contFileDTO);
    }
}