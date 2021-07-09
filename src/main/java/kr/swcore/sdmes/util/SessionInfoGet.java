package kr.swcore.sdmes.util;

import kr.swcore.sdmes.cont.ContFileController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;

public class SessionInfoGet {
    private static final Logger logger = LoggerFactory.getLogger(ContFileController.class);

    public static Object getCompNo(HttpSession session) {
        logger.info(session.getAttribute("compNo").getClass().getName());
        String typeCheck = session.getAttribute("compNo").getClass().getName();
        if(typeCheck.equals("java.lang.Integer")){
            return session.getAttribute("compNo");
        } else if(typeCheck.equals("java.lang.String")){
            return Integer.valueOf((String)session.getAttribute("compNo"));
        } else {
            return null;
        }
    }
}
