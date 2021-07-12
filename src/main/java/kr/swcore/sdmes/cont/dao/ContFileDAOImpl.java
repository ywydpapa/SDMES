package kr.swcore.sdmes.cont.dao;

import kr.swcore.sdmes.cont.dto.ContFileDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class ContFileDAOImpl implements ContFileDAO{

    @Inject
    SqlSession sqlSession;

    @Override
    public List<ContFileDTO> listFile(ContFileDTO contFileDTO) {
        return sqlSession.selectList("contFile.listFile", contFileDTO);
    }

    @Override
    public Integer uploadFile(ContFileDTO contFileDTO) {
        return sqlSession.insert("contFile.uploadFile", contFileDTO);
    }

    @Override
    public Integer uploadFileWithNew(ContFileDTO contFileDTO) {
        return sqlSession.update("contFile.uploadFileWithNew", contFileDTO);
    }

    @Override
    public Integer deleteFileWithFile(ContFileDTO contFileDTO) {
        return sqlSession.update("contFile.deleteFileWithFile", contFileDTO);
    }

    @Override
    public Integer deleteFile(ContFileDTO contFileDTO) {
        return sqlSession.update("contFile.deleteFile", contFileDTO);
    }

    @Override
    public ContFileDTO downloadFile(ContFileDTO contFileDTO) {
        return sqlSession.selectOne("contFile.downloadFile", contFileDTO);
    }
}
