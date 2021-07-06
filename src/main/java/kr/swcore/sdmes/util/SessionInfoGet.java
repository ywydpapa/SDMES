package kr.swcore.sdmes.util;

import javax.servlet.http.HttpSession;

public class SessionInfoGet {
    public static Integer getCompNo(HttpSession session) {
        Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
        return compNo;
    }
}
