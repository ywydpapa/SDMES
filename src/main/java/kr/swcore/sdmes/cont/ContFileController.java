package kr.swcore.sdmes.cont;

import kr.swcore.sdmes.code.service.CodeService;
import kr.swcore.sdmes.cont.dto.ContFileDTO;
import kr.swcore.sdmes.cont.service.ContFileService;
import kr.swcore.sdmes.util.SessionInfoGet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/contFile/*")
public class ContFileController {
    private static final Logger logger = LoggerFactory.getLogger(ContFileController.class);

    @Inject
    ContFileService contFileService;

    @Inject
    CodeService codeService;

    @RequestMapping("/listFile/{contNo}")
    public ResponseEntity<?> listFile(HttpSession session, @PathVariable("contNo") Integer contNo, @ModelAttribute ContFileDTO contFileDTO) throws IOException {
        Integer compNo = (Integer) SessionInfoGet.getCompNo(session);
        contFileDTO.setCompNo(compNo);

        List<ContFileDTO> ContFileDTOList = contFileService.listFile(session, contFileDTO);
        Map<String, Object> param = new HashMap<String, Object>();
        if(ContFileDTOList != null && ContFileDTOList.size() >= 0) {
            param.put("code", "10001");
            param.put("data", ContFileDTOList);
        } else {
            param.put("code", "20001");
        }

        return ResponseEntity.ok(param);
    }

    @RequestMapping("/uploadFile/{contNo}")
    public ResponseEntity<?> uploadFile(HttpSession session, @PathVariable("contNo") Integer contNo, @RequestParam(required = false, value = "tempFileld") String tempFileld, MultipartHttpServletRequest fileList) throws IOException {
        Integer compNo = (Integer) SessionInfoGet.getCompNo(session);
        Integer userNo = (Integer) session.getAttribute("userNo");
        ContFileDTO contFileDTO = new ContFileDTO();
        if(contNo == 0){
            contFileDTO.setTempFileld(tempFileld);
        } else {
            contFileDTO.setContNo(contNo);
        }
        contFileDTO.setCompNo(compNo);

        Integer result = contFileService.uploadFile(session, contFileDTO, fileList);
        Map<String, Object> param = new HashMap<String, Object>();

        if(result > 0) {
            param.put("code", "10001");
            param.put("data", result);
        } else {
            param.put("code", "20001");
        }

        return ResponseEntity.ok(param);
    }

    @RequestMapping("/deleteFile/{contNo}/{fileId}")
    public ResponseEntity<?> deleteFile(HttpSession session, @PathVariable("contNo") Integer contNo, @PathVariable("fileId") String fileId){
        Integer compNo = (Integer) SessionInfoGet.getCompNo(session);
        ContFileDTO contFileDTO = new ContFileDTO();
        if(contNo == 0) {
            contFileDTO.setContNo(contNo);
        }
        contFileDTO.setFileId(fileId);
        contFileDTO.setCompNo(compNo);

        Integer result = contFileService.deleteFile(session, contFileDTO);
        Map<String, Object> param = new HashMap<String, Object>();

        if(result > 0) {
            param.put("code", "10001");
        } else {
            param.put("code", "20001");
        }

        return ResponseEntity.ok(param);
    }

    @RequestMapping("/downloadFile/{contNo}/{fileId}")
    public ResponseEntity<?> downloadFile(HttpSession session, @PathVariable("contNo") Integer contNo, @PathVariable("fileId") String fileId) throws IOException {
        Integer compNo = (Integer) SessionInfoGet.getCompNo(session);
        ContFileDTO contFileDTO = new ContFileDTO();
        contFileDTO.setContNo(contNo);
        contFileDTO.setFileId(fileId);
        contFileDTO.setCompNo(compNo);

        ContFileDTO resultFile = contFileService.downloadFile(session, contFileDTO);
        String fileName = resultFile.getFileName();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.add("Content-Disposition", new String(fileName.getBytes("utf-8"), "ISO-8859-1"));
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(resultFile.getFileContent(), headers, HttpStatus.OK);

        return entity;
    }
}
